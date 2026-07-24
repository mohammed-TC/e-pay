import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';
import 'np_card.dart';

/// design.md §6 `NPAmountInput` — large display-face digit entry that grows
/// with the typed value, plus quick-amount mini-plate chips.
class NPAmountInput extends StatefulWidget {
  const NPAmountInput({
    required this.value,
    required this.onChanged,
    super.key,
    this.currencyCode = 'OMR',
    this.quickAmounts = const [],
    this.onQuickAmountTap,
    this.enabled = true,
  });

  /// Raw digits typed so far, no separators — e.g. `"12500"` renders as
  /// `"12.500"`. Purely presentational formatting; parsing to a numeric
  /// amount for wallet/payment use is the caller's responsibility.
  final String value;
  final ValueChanged<String> onChanged;
  final String currencyCode;
  final List<double> quickAmounts;
  final ValueChanged<double>? onQuickAmountTap;
  final bool enabled;

  @override
  State<NPAmountInput> createState() => _NPAmountInputState();
}

class _NPAmountInputState extends State<NPAmountInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant NPAmountInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String get _formatted {
    final digits = widget.value.padLeft(4, '0');
    final whole = digits.substring(0, digits.length - 3);
    final trimmedWhole = whole.replaceFirst(RegExp(r'^0+(?=\d)'), '');
    final frac = digits.substring(digits.length - 3);
    return '$trimmedWhole.$frac';
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final digitCount = widget.value.isEmpty ? 1 : widget.value.length;
    final fontSize = (32 + digitCount * 3).clamp(32, 56).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: widget.enabled ? _focusNode.requestFocus : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              AnimatedDefaultTextStyle(
                duration: reduceMotion
                    ? Duration.zero
                    : const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                style: AppTypography.monoAmount(
                  isArabic: isArabic,
                  color: colors.inkPrimary,
                ).copyWith(fontSize: fontSize, fontWeight: FontWeight.w700),
                child: Text(_formatted),
              ),
              const SizedBox(width: AppSpacing.sm),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: AppSpacing.xs,
                ),
                child: Text(
                  widget.currencyCode,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.inkTertiary,
                  ),
                ),
              ),
              SizedBox(
                width: 1,
                height: 1,
                child: Opacity(
                  opacity: 0,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    keyboardType: TextInputType.number,
                    onChanged: widget.onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.quickAmounts.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final amount in widget.quickAmounts)
                NPCard(
                  onTap: widget.enabled
                      ? () => widget.onQuickAmountTap?.call(amount)
                      : null,
                  borderRadius: AppRadius.chip,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  child: Text(
                    '${amount.toStringAsFixed(0)} ${widget.currencyCode}',
                    style: textTheme.labelLarge?.copyWith(
                      color: colors.inkPrimary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
