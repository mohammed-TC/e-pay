import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../onboarding/providers/auth_state_provider.dart';

/// Screen C6 — My QR
///
/// Static QR payload for the demo user's wallet id + a mocked "Share" (no
/// share-sheet dependency in this prototype — copies the payload and shows
/// a confirmation, matching the offline-mock philosophy of every other
/// screen's "mock" actions).
class MyQrScreen extends ConsumerWidget {
  const MyQrScreen({super.key});

  Future<void> _share(BuildContext context, String payload) async {
    await Clipboard.setData(ClipboardData(text: payload));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.walletQrShareCopied)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final authState = ref.watch(appAuthStateProvider);
    final profile = switch (authState) {
      AuthAuthed(:final profile) => profile,
      _ => null,
    };
    final payload = 'EMRALPAY:USER:${profile?.id ?? 'demo-user'}';

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.walletQrTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NPCard(
              interactive: false,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: QrImageView(data: payload, size: 220),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            if (profile != null)
              Text(
                profile.fullName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.walletQrSubtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).extension<AppColors>()!.inkSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            NPButton(
              label: l10n.walletQrShareCta,
              leadingIcon: Icons.ios_share,
              onPressed: () => unawaited(_share(context, payload)),
            ),
          ],
        ),
      ),
    );
  }
}
