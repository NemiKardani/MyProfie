import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:my_profile/utills/decoration_utils.dart';

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
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? initialValue;

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
    this.contentPadding,
    this.autovalidateMode,
    this.autofocus,
    this.focusNode,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode ?? autoValidateMode,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      initialValue: initialValue,
      textAlignVertical: textAlignVertical,
      autofillHints: autofillHints,
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
              contentPadding: contentPadding,
              icon: prefixIcon),
      validator: isShowDefaultValidator == true
          ? validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Please insert $labelText';
                }
                return null;
              }
          : validator,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onSubmited,
      autocorrect: isAutoCurrect,
    );
  }

  static const AutovalidateMode autoValidateMode =
      AutovalidateMode.onUserInteraction;
}
