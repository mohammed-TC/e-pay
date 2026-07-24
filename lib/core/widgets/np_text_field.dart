import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// design.md §6 `NPTextField` — sunken fill, animated emerald focus
/// underline (2px, 0→full width, 240ms `easeOutCubic`).
class NPTextField extends StatefulWidget {
  const NPTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
    this.enabled = true,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool enabled;

  @override
  State<NPTextField> createState() => _NPTextFieldState();
}

class _NPTextFieldState extends State<NPTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_handleFocusChange);
  }

  void _handleFocusChange() => setState(() {});

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final underlineColor = hasError
        ? colors.semanticDanger
        : colors.accentPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xs),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.input),
          child: ColoredBox(
            color: colors.surfaceSunken,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  obscureText: widget.obscureText,
                  keyboardType: widget.keyboardType,
                  enabled: widget.enabled,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colors.inkPrimary,
                  ),
                  cursorColor: colors.accentPrimary,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: textTheme.bodyLarge?.copyWith(
                      color: colors.inkTertiary,
                    ),
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.md,
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AnimatedContainer(
                        duration: reduceMotion
                            ? Duration.zero
                            : const Duration(milliseconds: 240),
                        curve: Curves.easeOutCubic,
                        height: 2,
                        width: _focusNode.hasFocus ? constraints.maxWidth : 0,
                        color: underlineColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorText!,
            style: textTheme.bodySmall?.copyWith(color: colors.semanticDanger),
          ),
        ],
      ],
    );
  }
}
