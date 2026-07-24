import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'np_card.dart';

/// design.md §6 `NPPinPad` — 3×4 grid of 64px square plates (1-9, then
/// biometric-or-blank / 0 / backspace). Presentational only — PIN
/// validation/attempt-counting belongs to a provider, never this widget.
class NPPinPad extends StatelessWidget {
  const NPPinPad({
    required this.onKeyTap,
    super.key,
    this.onBiometricTap,
  });

  final ValueChanged<String> onKeyTap;
  final VoidCallback? onBiometricTap;

  static const _digitRows = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final row in _digitRows) _buildRow(row),
        _buildBottomRow(),
      ],
    );
  }

  Widget _buildRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final key in keys)
            _NPPinKey(label: key, onTap: () => onKeyTap(key)),
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (onBiometricTap != null)
            _NPPinKey(icon: Icons.fingerprint, onTap: onBiometricTap)
          else
            const _NPPinKey(label: '#'),
          _NPPinKey(label: '0', onTap: () => onKeyTap('0')),
          _NPPinKey(
            icon: Icons.backspace_outlined,
            onTap: () => onKeyTap('backspace'),
          ),
        ],
      ),
    );
  }
}

class _NPPinKey extends StatelessWidget {
  const _NPPinKey({this.label, this.icon, this.onTap});

  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 64,
      height: 64,
      child: NPCard(
        onTap: onTap,
        borderRadius: AppRadius.button,
        padding: EdgeInsets.zero,
        child: Center(
          child: label != null
              ? Text(
                  label!,
                  style: textTheme.displayMedium?.copyWith(
                    color: colors.inkPrimary,
                  ),
                )
              : Icon(icon, size: 24, color: colors.inkPrimary),
        ),
      ),
    );
  }
}
