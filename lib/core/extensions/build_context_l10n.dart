import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';

/// `context.l10n.<key>` — architecture.md §7.1: strings only via generated ARB keys.
extension BuildContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
