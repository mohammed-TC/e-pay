import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/rental_bookings_provider.dart';
import '../widgets/rental_booking_tile.dart';

/// Screen L5 — My Rentals
///
/// Booking history — product.md L5. Empty-state CTA routes back to L1;
/// this list is also the future repeat-booking entry point for the K1 chat
/// cross-sell scenario (not built in this phase).
class MyRentalsScreen extends ConsumerWidget {
  const MyRentalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final bookingsAsync = ref.watch(rentalBookingsProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.rentalMyRentalsTitle)),
      body: bookingsAsync.when(
        data: (bookings) {
          if (bookings.isEmpty) {
            return NPEmptyState(
              title: l10n.rentalMyRentalsEmptyTitle,
              body: l10n.rentalMyRentalsEmptyBody,
              ctaLabel: l10n.rentalMyRentalsEmptyCta,
              onCta: () => context.push(Routes.rentalSearch),
            );
          }
          return ListView(
            children: [
              for (final booking in bookings) ...[
                RentalBookingTile(booking: booking),
                const SizedBox(height: AppSpacing.md),
              ],
            ],
          );
        },
        loading: () => ListView(
          children: List.generate(
            3,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: NPShimmer.card(height: 120),
            ),
          ),
        ),
        error: (error, stackTrace) => NPErrorState(
          title: l10n.homeErrorTitle,
          body: l10n.homeErrorBody,
          onRetry: () => ref.invalidate(rentalBookingsProvider),
          retryLabel: l10n.homeErrorRetry,
        ),
      ),
    );
  }
}
