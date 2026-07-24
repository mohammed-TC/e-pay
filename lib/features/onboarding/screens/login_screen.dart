import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_text_field.dart';

/// Screen A4 — Login / Register
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  static const _minLength = 7;

  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = _controller.text.trim();
    if (value.length < _minLength) {
      setState(() => _error = context.l10n.loginMobileError);
      return;
    }
    setState(() => _error = null);
    unawaited(context.push(Routes.otp, extra: value));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final motionDuration = reduceMotion
        ? Duration.zero
        : const Duration(milliseconds: 240);

    return NPScaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.xxxl),
            AnimatedSize(
              duration: motionDuration,
              curve: Curves.easeOutCubic,
              alignment: AlignmentDirectional.bottomStart,
              child: SizedBox(
                height: keyboardOpen ? 0 : 56 + AppSpacing.lg,
                child: AnimatedOpacity(
                  duration: motionDuration,
                  curve: Curves.easeOutCubic,
                  opacity: keyboardOpen ? 0 : 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 56,
                    height: 56,
                    alignment: AlignmentDirectional.topStart,
                    excludeFromSemantics: true,
                  ),
                ),
              ),
            ),
            Text(context.l10n.loginTitle, style: textTheme.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              context.l10n.loginSubtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.inkSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            MergeSemantics(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.loginMobileLabel,
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _CountryCodeChip(),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: NPTextField(
                          hint: context.l10n.loginMobileHint,
                          controller: _controller,
                          keyboardType: TextInputType.phone,
                          errorText: _error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            NPButton(label: context.l10n.loginContinue, onPressed: _submit),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

/// Fixed mock country-code prefix — full country picker is out of scope for
/// this demo (product.md A4).
class _CountryCodeChip extends StatelessWidget {
  const _CountryCodeChip();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 52,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
      alignment: Alignment.center,
      child: Text(
        context.l10n.loginCountryCode,
        style: textTheme.bodyLarge?.copyWith(color: colors.inkPrimary),
      ),
    );
  }
}
