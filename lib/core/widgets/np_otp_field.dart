import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';

/// design.md §6 `NPOtpField` — N sunken boxes, auto-advance on digit entry,
/// backspace navigates back to the previous box. Generic: this widget never
/// hardcodes or validates a mock OTP value — that belongs to the caller.
class NPOtpField extends StatefulWidget {
  const NPOtpField({
    required this.onCompleted,
    super.key,
    this.length = 6,
    this.onChanged,
  });

  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;

  @override
  State<NPOtpField> createState() => _NPOtpFieldState();
}

class _NPOtpFieldState extends State<NPOtpField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    HardwareKeyboard.instance.addHandler(_handleHardwareKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleHardwareKey);
    for (var i = 0; i < widget.length; i++) {
      _controllers[i].dispose();
      _focusNodes[i].dispose();
    }
    super.dispose();
  }

  String get _code => _controllers.map((controller) => controller.text).join();

  bool _handleHardwareKey(KeyEvent event) {
    if (event is! KeyDownEvent ||
        event.logicalKey != LogicalKeyboardKey.backspace) {
      return false;
    }
    final index = _focusNodes.indexWhere((node) => node.hasFocus);
    if (index > 0 && _controllers[index].text.isEmpty) {
      _controllers[index - 1].clear();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      widget.onChanged?.call(_code);
      return true;
    }
    return false;
  }

  void _handleChanged(int index, String rawValue) {
    var value = rawValue;
    if (value.length > 1) {
      value = value.characters.last;
      _controllers[index].value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    widget.onChanged?.call(_code);
    if (value.isNotEmpty && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (_code.length == widget.length) {
      widget.onCompleted(_code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final digitStyle = AppTypography.monoAmount(
      isArabic: isArabic,
      color: colors.inkPrimary,
    ).copyWith(fontSize: 20, fontWeight: FontWeight.w700);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < widget.length; i++)
          _OtpBox(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            hasValue: _controllers[i].text.isNotEmpty,
            reduceMotion: reduceMotion,
            textStyle: digitStyle,
            fillColor: colors.surfaceSunken,
            onChanged: (value) => _handleChanged(i, value),
          ),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.hasValue,
    required this.reduceMotion,
    required this.textStyle,
    required this.fillColor,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasValue;
  final bool reduceMotion;
  final TextStyle textStyle;
  final Color fillColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: AnimatedScale(
        scale: hasValue ? 1 : 0.85,
        duration: reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 150),
        curve: Curves.easeOutBack,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(AppRadius.input),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: textStyle,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsetsDirectional.only(top: AppSpacing.lg),
            ),
          ),
        ),
      ),
    );
  }
}
