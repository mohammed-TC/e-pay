import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_plate.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_text_field.dart';
import '../providers/auth_state_provider.dart';

/// Screen A6 — Profile Setup
class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _nameError;
  String? _emailError;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final hasEmailError = email.isNotEmpty && !email.contains('@');
    setState(() {
      _nameError = name.isEmpty ? context.l10n.profileSetupNameError : null;
      _emailError = hasEmailError ? context.l10n.profileSetupEmailError : null;
    });
    if (name.isEmpty || hasEmailError) return;

    setState(() => _saving = true);
    await ref
        .read(appAuthStateProvider.notifier)
        .completeProfile(fullName: name, email: email.isEmpty ? null : email);
    if (!mounted) return;
    context.go(Routes.pinSetup);
  }

  void _handleAvatarTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.profileSetupAvatarDemoMessage)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPScaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.xxxl),
                  Text(
                    context.l10n.profileSetupTitle,
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    context.l10n.profileSetupSubtitle,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.inkSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  Center(child: _AvatarPicker(onTap: _handleAvatarTap)),
                  const SizedBox(height: AppSpacing.xxl),
                  NPTextField(
                    label: context.l10n.profileSetupNameLabel,
                    hint: context.l10n.profileSetupNameHint,
                    controller: _nameController,
                    errorText: _nameError,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  NPTextField(
                    label: context.l10n.profileSetupEmailLabel,
                    hint: context.l10n.profileSetupEmailHint,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          NPButton(
            label: context.l10n.profileSetupContinue,
            onPressed: _saving ? null : _submit,
            loading: _saving,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

/// Mock avatar picker — no real image picker in this demo (product.md A6).
/// Circular [NPPlate] carries the same hard-shadow tap physics as every
/// other tappable in the app (design-tokens.md: "NPButton/NPCard mandatory
/// for all tappables").
class _AvatarPicker extends StatelessWidget {
  const _AvatarPicker({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Semantics(
      button: true,
      label: context.l10n.profileSetupAvatarUploadLabel,
      child: NPPlate(
        onTap: onTap,
        color: colors.surfaceSunken,
        shadowColor: colors.plateShadow,
        borderRadius: 48,
        child: SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person_outline, size: 40, color: colors.inkSecondary),
              PositionedDirectional(
                bottom: 0,
                end: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colors.accentPrimary,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.surfacePage, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
