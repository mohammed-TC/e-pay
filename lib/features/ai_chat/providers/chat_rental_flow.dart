import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../data/repositories/rental_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../payment/models/payment_request.dart';
import '../../rental/models/rental_location.dart';
import '../../rental/providers/rental_catalog_provider.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../models/chat_card_data.dart';
import '../models/chat_message.dart';
import 'chat_reminders_provider.dart';

/// Scenario 2 — Car Rental Booking with Loyalty Rewards & Cross-Sell
/// (product.md K1, Module L). A strictly linear multi-turn dialogue: each
/// [RentalChatStage] either expects a yes/no answer or free-text (location,
/// dates). Reuses Module L's repository/models so the numbers a customer
/// sees in chat are the exact same ones the L1–L5 screens would compute.
enum RentalChatStage {
  awaitingLocation,
  awaitingDates,
  awaitingPointsAnswer,
  awaitingAddonAnswer,
  awaitingLicenceAnswer,
  awaitingRoadsideAnswer,
  awaitingPayment,
}

/// Everything accumulated across the rental conversation so far — threaded
/// through `ChatNotifier` (`chat_provider.dart`) the same way its
/// `_pendingOffer` fields thread the vehicle-renewal/AutoPay dialogue.
class RentalChatContext {
  const RentalChatContext({
    required this.stage,
    this.locationId,
    this.locationName,
    this.isAirport = false,
    this.pickupDate,
    this.returnDate,
    this.days = 1,
    this.vehicleClassId,
    this.vehicleClassName,
    this.subtotal = Money.zero,
    this.pointsRedeemed = 0,
    this.pointsDiscount = Money.zero,
    this.addonSelected = false,
    this.roadsideSelected = false,
    this.addonsCost = Money.zero,
    this.addonNames = const <String>[],
  });

  final RentalChatStage stage;
  final String? locationId;
  final String? locationName;
  final bool isAirport;
  final DateTime? pickupDate;
  final DateTime? returnDate;
  final int days;
  final String? vehicleClassId;
  final String? vehicleClassName;
  final Money subtotal;
  final int pointsRedeemed;
  final Money pointsDiscount;
  final bool addonSelected;
  final bool roadsideSelected;
  final Money addonsCost;
  final List<String> addonNames;

  Money get total => subtotal - pointsDiscount + addonsCost;

  RentalChatContext copyWith({
    RentalChatStage? stage,
    String? locationId,
    String? locationName,
    bool? isAirport,
    DateTime? pickupDate,
    DateTime? returnDate,
    int? days,
    String? vehicleClassId,
    String? vehicleClassName,
    Money? subtotal,
    int? pointsRedeemed,
    Money? pointsDiscount,
    bool? addonSelected,
    bool? roadsideSelected,
    Money? addonsCost,
    List<String>? addonNames,
  }) {
    return RentalChatContext(
      stage: stage ?? this.stage,
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      isAirport: isAirport ?? this.isAirport,
      pickupDate: pickupDate ?? this.pickupDate,
      returnDate: returnDate ?? this.returnDate,
      days: days ?? this.days,
      vehicleClassId: vehicleClassId ?? this.vehicleClassId,
      vehicleClassName: vehicleClassName ?? this.vehicleClassName,
      subtotal: subtotal ?? this.subtotal,
      pointsRedeemed: pointsRedeemed ?? this.pointsRedeemed,
      pointsDiscount: pointsDiscount ?? this.pointsDiscount,
      addonSelected: addonSelected ?? this.addonSelected,
      roadsideSelected: roadsideSelected ?? this.roadsideSelected,
      addonsCost: addonsCost ?? this.addonsCost,
      addonNames: addonNames ?? this.addonNames,
    );
  }
}

/// One turn's worth of reply plus the next [RentalChatContext] — mirrors
/// `PendingReplyResult`'s shape in `chat_intent_engine.dart`.
typedef RentalFlowResult = ({
  List<ChatMessage> messages,
  RentalChatContext context,
});

String _newId() => DateTime.now().microsecondsSinceEpoch.toString();

ChatMessage _text(String text) =>
    ChatMessage.assistantText(id: _newId(), text: text, sentAt: DateTime.now());

ChatMessage _card(String text, ChatCardData card) => ChatMessage.assistantCard(
  id: _newId(),
  text: text,
  card: card,
  sentAt: DateTime.now(),
);

/// Mirrors `Money.format(context)` without a `BuildContext` — same
/// workaround as `chat_intent_engine.dart`'s `_formatMoney`.
String _formatMoney(Money money, Locale locale) {
  final formatter = NumberFormat.decimalPatternDigits(
    locale: locale.toString(),
    decimalDigits: 3,
  );
  return '${formatter.format(money.amount)} ${money.currencyCode}';
}

const Map<String, int> _weekdayNames = {
  'monday': DateTime.monday,
  'tuesday': DateTime.tuesday,
  'wednesday': DateTime.wednesday,
  'thursday': DateTime.thursday,
  'friday': DateTime.friday,
  'saturday': DateTime.saturday,
  'sunday': DateTime.sunday,
};

int? _findWeekday(String text) {
  for (final entry in _weekdayNames.entries) {
    if (text.contains(entry.key)) return entry.value;
  }
  return null;
}

int _findHour(String text) => text.contains('evening') ? 17 : 9;

DateTime _nextOccurrence(DateTime from, int weekday, int hour) {
  var candidate = DateTime(from.year, from.month, from.day, hour);
  final diff = (weekday - from.weekday + 7) % 7;
  candidate = candidate.add(Duration(days: diff));
  if (!candidate.isAfter(from)) {
    candidate = candidate.add(const Duration(days: 7));
  }
  return candidate;
}

/// Parses free text like "Friday morning until Monday evening" into a
/// pickup/return [DateTime] pair — rule-based (no LLM), same spirit as
/// `chat_intent_engine.dart`'s keyword matching. Returns `null` when no two
/// weekdays can be found.
({DateTime pickup, DateTime returnDate})? parseRentalDateRange(
  String input,
  DateTime now,
) {
  final q = input.toLowerCase();
  final parts = q.split(RegExp(r'\buntil\b|\bto\b'));
  if (parts.length >= 2) {
    final pickupWeekday = _findWeekday(parts[0]);
    final returnWeekday = _findWeekday(parts[1]);
    if (pickupWeekday != null && returnWeekday != null) {
      final pickup = _nextOccurrence(now, pickupWeekday, _findHour(parts[0]));
      final returnDate = _nextOccurrence(
        pickup,
        returnWeekday,
        _findHour(parts[1]),
      );
      return (pickup: pickup, returnDate: returnDate);
    }
  }

  final found = <int>[];
  for (final entry in _weekdayNames.entries) {
    if (q.contains(entry.key) && !found.contains(entry.value)) {
      found.add(entry.value);
    }
  }
  if (found.length < 2) return null;
  final pickup = _nextOccurrence(now, found[0], _findHour(q));
  final returnDate = _nextOccurrence(pickup, found[1], _findHour(q));
  return (pickup: pickup, returnDate: returnDate);
}

RentalLocation? _matchLocation(List<RentalLocation> locations, String input) {
  final q = input.toLowerCase();
  for (final location in locations) {
    if (q.contains(location.name.toLowerCase())) return location;
  }
  for (final location in locations) {
    final firstWord = location.name.split(' ').first.toLowerCase();
    if (q.contains(firstWord)) return location;
  }
  return null;
}

/// Best-effort yes/no classifier tolerant of the plain acknowledgements a
/// live demo presenter is likely to type ("Perfect.", "Great") in addition
/// to the usual yes/no keywords `chat_intent_engine.dart`'s
/// `resolveAffirmation` already covers. Returns `null` when unclear.
bool? _resolveYesNo(String input) {
  final q = input.toLowerCase();
  if (q.contains('no') || q.contains('nope') || q.contains("don't")) {
    return false;
  }
  if (q.contains('yes') ||
      q.contains('yeah') ||
      q.contains('sure') ||
      q.contains('perfect') ||
      q.contains('great') ||
      q.contains('ok') ||
      q.contains('add it') ||
      q.contains('go ahead')) {
    return true;
  }
  return null;
}

/// Opens the scenario — product.md K1 Scenario 2, first turn.
RentalFlowResult startRentalBooking({required AppLocalizations l10n}) {
  return (
    messages: [_text(l10n.chatRentalLocationPrompt)],
    context: const RentalChatContext(stage: RentalChatStage.awaitingLocation),
  );
}

/// Advances the dialogue by one turn — the actual state machine. Reads
/// Module L's providers read-only, same rule `chat_intent_engine.dart`
/// follows for every other feature it answers questions from.
Future<RentalFlowResult> stepRentalFlow({
  required Ref ref,
  required AppLocalizations l10n,
  required Locale locale,
  required RentalChatContext context,
  required String input,
}) {
  switch (context.stage) {
    case RentalChatStage.awaitingLocation:
      return _stepLocation(ref, l10n, context, input);
    case RentalChatStage.awaitingDates:
      return _stepDates(ref, l10n, locale, context, input);
    case RentalChatStage.awaitingPointsAnswer:
      return _stepPoints(ref, l10n, locale, context, input);
    case RentalChatStage.awaitingAddonAnswer:
      return _stepAddon(ref, l10n, locale, context, input);
    case RentalChatStage.awaitingLicenceAnswer:
      return _stepLicence(ref, l10n, locale, context, input);
    case RentalChatStage.awaitingRoadsideAnswer:
      return _stepRoadside(ref, l10n, locale, context, input);
    case RentalChatStage.awaitingPayment:
      return Future.value((
        messages: [_text(l10n.chatRentalAwaitingPayment)],
        context: context,
      ));
  }
}

Future<RentalFlowResult> _stepLocation(
  Ref ref,
  AppLocalizations l10n,
  RentalChatContext context,
  String input,
) async {
  final locations = await ref.read(rentalLocationsProvider.future);
  final match = _matchLocation(locations, input);
  if (match == null) {
    return (
      messages: [_text(l10n.chatRentalLocationNotFound)],
      context: context,
    );
  }
  return (
    messages: [_text(l10n.chatRentalDatesPrompt)],
    context: context.copyWith(
      stage: RentalChatStage.awaitingDates,
      locationId: match.id,
      locationName: match.name,
      isAirport: match.isAirport,
    ),
  );
}

Future<RentalFlowResult> _stepDates(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  String input,
) async {
  final range = parseRentalDateRange(input, DateTime.now());
  if (range == null) {
    return (
      messages: [_text(l10n.chatRentalDatesNotUnderstood)],
      context: context,
    );
  }

  final days = RentalRepository.calculateDays(range.pickup, range.returnDate);
  final classes = await ref.read(rentalVehicleClassesProvider.future);
  final compactSuv = classes.firstWhere(
    (vehicleClass) => vehicleClass.name == 'Compact SUV',
    orElse: () => classes[classes.length > 1 ? 1 : 0],
  );
  final subtotal = RentalRepository.classTotal(compactSuv, days);
  final rewards = await ref.read(appRewardsProvider.future);
  final rewardsValue = Money.fromAmount(rewards.points * 0.01);

  final optionLines = classes
      .map(
        (vehicleClass) =>
            '• ${vehicleClass.name} – ${_formatMoney(RentalRepository.classTotal(vehicleClass, days), locale)}',
      )
      .join('\n');

  return (
    messages: [
      _text(l10n.chatRentalOptionsIntro(optionLines)),
      _text(
        l10n.chatRentalPointsOffer(
          rewards.points,
          _formatMoney(rewardsValue, locale),
        ),
      ),
    ],
    context: context.copyWith(
      stage: RentalChatStage.awaitingPointsAnswer,
      pickupDate: range.pickup,
      returnDate: range.returnDate,
      days: days,
      vehicleClassId: compactSuv.id,
      vehicleClassName: compactSuv.name,
      subtotal: subtotal,
    ),
  );
}

Future<RentalFlowResult> _stepPoints(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  String input,
) async {
  final resolution = _resolveYesNo(input);
  if (resolution == null) {
    return (messages: [_text(l10n.chatReplyFallback)], context: context);
  }

  var next = context;
  final messages = <ChatMessage>[];
  if (resolution) {
    final rewards = await ref.read(appRewardsProvider.future);
    final discount = RentalRepository.pointsToDiscount(
      rewards.points,
      context.subtotal,
    );
    final redeemed = RentalRepository.discountToPoints(discount);
    next = context.copyWith(pointsDiscount: discount, pointsRedeemed: redeemed);
    final newTotal = context.subtotal - discount;
    messages.add(
      _text(
        l10n.chatRentalPointsApplied(
          context.vehicleClassName ?? '',
          _formatMoney(newTotal, locale),
          newTotal.amount.floor(),
        ),
      ),
    );
  } else {
    messages.add(_text(l10n.chatRentalPointsSkipped));
  }
  return (
    messages: messages,
    context: next.copyWith(stage: RentalChatStage.awaitingAddonAnswer),
  );
}

Future<RentalFlowResult> _stepAddon(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  String input,
) async {
  final resolution = _resolveYesNo(input);
  if (resolution == null) {
    return (messages: [_text(l10n.chatReplyFallback)], context: context);
  }

  var next = context;
  final messages = <ChatMessage>[];
  if (resolution) {
    final addons = await ref.read(rentalAddonsProvider.future);
    final protection = addons.firstWhere(
      (addon) => addon.name == 'Full Damage Protection',
      orElse: () => addons.first,
    );
    final cost = RentalRepository.addonTotal(protection, context.days);
    next = context.copyWith(
      addonSelected: true,
      addonsCost: context.addonsCost + cost,
      addonNames: [...context.addonNames, protection.name],
    );
    final earned = next.total.amount.floor() * 2;
    messages
      ..add(_text(l10n.chatRentalAddonAcceptedTitle))
      ..add(_text(l10n.chatRentalAddonAcceptedPoints(earned)));
  } else {
    messages.add(_text(l10n.chatRentalAddonDeclined));
  }
  return _continueAfterAddon(ref, l10n, locale, next, messages);
}

Future<RentalFlowResult> _continueAfterAddon(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  List<ChatMessage> messages,
) async {
  final reminders = ref.read(chatRemindersProvider.notifier);
  if (!reminders.hasSeen('rentalLicenceReminder')) {
    reminders.markSeen('rentalLicenceReminder');
    messages.add(_text(l10n.chatRentalLicenceNudge));
    return (
      messages: messages,
      context: context.copyWith(stage: RentalChatStage.awaitingLicenceAnswer),
    );
  }
  return _continueAfterLicence(ref, l10n, locale, context, messages);
}

Future<RentalFlowResult> _stepLicence(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  String input,
) async {
  final resolution = _resolveYesNo(input);
  final messages = <ChatMessage>[
    _text(
      resolution == false
          ? l10n.chatRentalLicenceReminderSkipped
          : l10n.chatRentalLicenceReminderSet,
    ),
  ];
  return _continueAfterLicence(ref, l10n, locale, context, messages);
}

Future<RentalFlowResult> _continueAfterLicence(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  List<ChatMessage> messages,
) async {
  final reminders = ref.read(chatRemindersProvider.notifier);
  if (context.isAirport && !reminders.hasSeen('rentalRoadsideOffer')) {
    reminders.markSeen('rentalRoadsideOffer');
    final addons = await ref.read(rentalAddonsProvider.future);
    final roadside = addons.firstWhere(
      (addon) => addon.name == 'Roadside Assistance Plus',
      orElse: () => addons.last,
    );
    final price = RentalRepository.addonTotal(roadside, context.days);
    messages.add(
      _text(
        l10n.chatRentalRoadsideOffer(
          context.locationName ?? '',
          _formatMoney(price, locale),
        ),
      ),
    );
    return (
      messages: messages,
      context: context.copyWith(stage: RentalChatStage.awaitingRoadsideAnswer),
    );
  }
  return _finalizeBooking(l10n, context, messages);
}

Future<RentalFlowResult> _stepRoadside(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
  RentalChatContext context,
  String input,
) async {
  final resolution = _resolveYesNo(input);
  var next = context;
  final messages = <ChatMessage>[];
  if (resolution == true) {
    final addons = await ref.read(rentalAddonsProvider.future);
    final roadside = addons.firstWhere(
      (addon) => addon.name == 'Roadside Assistance Plus',
      orElse: () => addons.last,
    );
    final cost = RentalRepository.addonTotal(roadside, context.days);
    next = context.copyWith(
      roadsideSelected: true,
      addonsCost: context.addonsCost + cost,
      addonNames: [...context.addonNames, roadside.name],
    );
    messages.add(_text(l10n.chatRentalRoadsideAccepted));
  } else {
    messages.add(_text(l10n.chatRentalRoadsideDeclined));
  }
  return _finalizeBooking(l10n, next, messages);
}

RentalFlowResult _finalizeBooking(
  AppLocalizations l10n,
  RentalChatContext context,
  List<ChatMessage> messages,
) {
  final request = PaymentRequest(
    type: TxnType.carRental,
    payeeName: context.vehicleClassName ?? '',
    payeeSubtitle: context.locationName ?? '',
    lineItems: [
      PaymentLineItem(
        label: l10n.rentalReviewRentalCostLabel,
        amount: context.subtotal,
      ),
      if (context.addonsCost > Money.zero)
        PaymentLineItem(
          label: l10n.rentalReviewAddonsCostLabel,
          amount: context.addonsCost,
        ),
    ],
    amount: context.total,
    fee: Money.zero,
    meta: {
      'rentalBonusPoints': context.addonSelected
          ? context.total.amount.floor()
          : 0,
    },
  );
  messages.add(
    _card(
      l10n.chatRentalBookingReadyIntro,
      ChatCardData.paymentShortcut(
        title: context.vehicleClassName ?? '',
        subtitle: l10n.chatRentalCardSubtitle(
          context.locationName ?? '',
          context.days,
        ),
        request: request,
      ),
    ),
  );
  return (
    messages: messages,
    context: context.copyWith(stage: RentalChatStage.awaitingPayment),
  );
}
