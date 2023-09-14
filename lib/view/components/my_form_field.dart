import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/color/colors.dart';
import '../../utills/decoration_utils.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isEnable;
  final bool isRequire;
  final bool isReadOnly;
  final bool isAutoCurrect;
  final bool isShowDefaultValidator;
  final bool obscureText;
  final FormFieldValidator? validator;
  final ValueChanged? onChanged;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;
  final int? maxLines;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? prefixIcon;
  final Color? enableColor;
  final Color? disabledColor;
  final Color? focusedColor;
  final Color? fillColor;
  final Color? labelTextColor;
  final Widget? prefixIconUnderLine;
  final Function(String)? onSubmited;
  final BorderRadius? borderRadius;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final bool? alignLabelWithHint;
  final double? fontSize;
  final Color? hintColor;
  final TextStyle? hintTextStyle;
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final TextAlign? textAlign;

  const MyFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isEnable = true,
    this.isRequire = false,
    this.isReadOnly = false,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.fontSize,
    this.hintTextStyle,
    this.maxLength,
    this.validator,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.hintColor,
    this.textAlignVertical,
    this.borderRadius,
    this.prefixIcon,
    this.onSubmited,
    this.floatingLabelBehavior,
    this.prefixIconUnderLine,
    this.fillColor,
    this.enableColor,
    this.disabledColor,
    this.focusedColor,
    this.labelTextColor,
    this.inputFormatters,
    this.alignLabelWithHint,
    this.autofillHints,
    this.isShowDefaultValidator = false,
    this.suffixIcon,
    this.isAutoCurrect = false,
    this.obscureText = false,
    this.decoration,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: isEnable,
      obscureText: obscureText,
      textAlignVertical: textAlignVertical,
      autofillHints: autofillHints ??
          const [
            AutofillHints.name,
            AutofillHints.email,
            AutofillHints.password,
            AutofillHints.newPassword
          ],
      textAlign: textAlign ?? TextAlign.start,
      readOnly: isReadOnly,
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          color: isRequire
              ? primaryTextColor
              : Theme.of(context).textTheme.bodyLarge!.color),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      maxLength: maxLength,
      decoration: decoration ??
          DecorationUtils(context).getUnderlineInputDecoration(
              labelText: labelText,
              fillColor: fillColor,
              alignLabelWithHint: alignLabelWithHint,
              labelTextColor: labelTextColor,
              focusedColor: focusedColor,
              suffixIcon: suffixIcon,
              enableColor: enableColor,
              disabledColor: disabledColor,
              floatingLabelBehavior: floatingLabelBehavior,
              isRequire: isRequire,
              isEnable: isEnable,
              hintColor: hintColor,
              prefixIcon: prefixIconUnderLine,
              borderRadius: borderRadius,
              icon: prefixIcon),
      onChanged: onChanged,
      onTap: onTap,
      autocorrect: isAutoCurrect,
    );
  }
}
