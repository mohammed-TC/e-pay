import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_otp_field.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../providers/auth_state_provider.dart';

/// Screen A5 — OTP Verification
class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({required this.mobileNumber, super.key});

  final String mobileNumber;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  static const _resendSeconds = 30;

  Timer? _timer;
  int _secondsLeft = _resendSeconds;
  String? _error;
  bool _verifying = false;
  int _fieldResetKey = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft -= 1);
      }
    });
  }

  Future<void> _handleSubmit(String code) async {
    setState(() {
      _verifying = true;
      _error = null;
    });
    final verified = await ref
        .read(appAuthStateProvider.notifier)
        .verifyOtp(widget.mobileNumber, code);
    if (!mounted) return;
    if (verified) {
      context.go(Routes.profileSetup);
      return;
    }
    setState(() {
      _verifying = false;
      _error = context.l10n.otpIncorrectCode;
      _fieldResetKey++;
    });
  }

  String get _maskedMobile {
    final digits = widget.mobileNumber;
    if (digits.length <= 4) return digits;
    return '••• ${digits.substring(digits.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPScaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.xxxl),
            Text(context.l10n.otpTitle, style: textTheme.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${context.l10n.otpSentToPrefix} $_maskedMobile',
              style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
            ),
            const SizedBox(height: AppSpacing.xxl),
            IgnorePointer(
              ignoring: _verifying,
              child: Opacity(
                opacity: _verifying ? 0.5 : 1,
                child: NPOtpField(
                  key: ValueKey(_fieldResetKey),
                  onCompleted: _handleSubmit,
                ),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                _error!,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.semanticDanger,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            _ResendRow(secondsLeft: _secondsLeft, onResend: _startTimer),
          ],
        ),
      ),
    );
  }
}

/// Countdown label / tappable resend action — local UI-timing state only,
/// no real resend call (flutter-conventions.md's pure-local-state exception).
class _ResendRow extends StatelessWidget {
  const _ResendRow({required this.secondsLeft, required this.onResend});

  final int secondsLeft;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    if (secondsLeft > 0) {
      return Text(
        '${context.l10n.otpResendCountdownLabel} '
        '$secondsLeft${context.l10n.otpResendSecondsSuffix}',
        style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
      );
    }
    return TextButton(
      onPressed: onResend,
      style: TextButton.styleFrom(
        foregroundColor: colors.accentPrimary,
        splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.zero,
        alignment: AlignmentDirectional.centerStart,
      ),
      child: Text(context.l10n.otpResendAction),
    );
  }
}
