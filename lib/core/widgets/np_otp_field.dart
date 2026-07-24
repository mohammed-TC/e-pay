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

    return LayoutBuilder(
      builder: (context, constraints) {
        final idealSize =
            (constraints.maxWidth - AppSpacing.md * (widget.length - 1)) /
            widget.length;
        final boxSize = idealSize.clamp(48.0, 56.0);
        final totalBoxWidth = boxSize * widget.length;
        final rawGap =
            (constraints.maxWidth - totalBoxWidth) / (widget.length - 1);
        final gap = rawGap.clamp(AppSpacing.sm, AppSpacing.xl);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.length; i++) ...[
              if (i > 0) SizedBox(width: gap),
              _OtpBox(
                size: boxSize,
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                hasValue: _controllers[i].text.isNotEmpty,
                reduceMotion: reduceMotion,
                textStyle: digitStyle,
                fillColor: colors.surfaceSunken,
                borderColor: colors.inkPrimary.withValues(alpha: 0.08),
                focusColor: colors.accentPrimary,
                onChanged: (value) => _handleChanged(i, value),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _OtpBox extends StatefulWidget {
  const _OtpBox({
    required this.size,
    required this.controller,
    required this.focusNode,
    required this.hasValue,
    required this.reduceMotion,
    required this.textStyle,
    required this.fillColor,
    required this.borderColor,
    required this.focusColor,
    required this.onChanged,
  });

  final double size;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasValue;
  final bool reduceMotion;
  final TextStyle textStyle;
  final Color fillColor;
  final Color borderColor;
  final Color focusColor;
  final ValueChanged<String> onChanged;

  @override
  State<_OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<_OtpBox> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isFocused = widget.focusNode.hasFocus;
    final radius = BorderRadius.circular(AppRadius.input);
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedScale(
        scale: widget.hasValue ? 1 : 0.85,
        duration: widget.reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 150),
        curve: Curves.easeOutBack,
        // Fill lives in `decoration` (painted first, behind the field);
        // the border lives in `foregroundDecoration` (painted last, on top
        // of the field) so nothing the TextField renders — its own square
        // hit-test/paint bounds — can notch the rounded corners.
        child: AnimatedContainer(
          duration: widget.reduceMotion
              ? Duration.zero
              : const Duration(milliseconds: 120),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: widget.fillColor,
            borderRadius: radius,
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: isFocused ? widget.focusColor : widget.borderColor,
              width: isFocused ? 2 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Center(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: widget.textStyle,
                cursorColor: widget.focusColor,
                // Pin the line box to the font size so the caret tracks the
                // digit's visual height instead of the type scale's 24/18
                // line-height ratio, which otherwise leaves the caret
                // floating above the glyph's optical center.
                strutStyle: StrutStyle(
                  fontSize: widget.textStyle.fontSize,
                  height: 1,
                  forceStrutHeight: true,
                ),
                cursorHeight: widget.textStyle.fontSize,
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
