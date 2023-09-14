import 'package:flutter/material.dart';
import 'package:my_profile/theme/color/colors.dart';

class DecorationUtils {
  BuildContext context;

  DecorationUtils(this.context);

  InputDecoration getUnderlineInputDecoration({
    String? labelText = "",
    bool isRequire = false,
    bool isEnable = true,
    final Color? enableColor,
    final Color? disabledColor,
    bool? alignLabelWithHint,
    final Color? focusedColor,
    final Color? labelTextColor,
    final FloatingLabelBehavior? floatingLabelBehavior,
    icon,
    final Widget? prefixIcon,
    final Widget? suffixIcon,
    final BorderRadius? borderRadius,
    final Color? fillColor,
    final Color? hintColor,
    final EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      fillColor: isRequire ? fillColor ?? textFieldBgColor : textFieldBgColor,
      filled: (isEnable) ? true : true,
      alignLabelWithHint: alignLabelWithHint,
      suffixIcon: suffixIcon,
      icon: icon,
      border: InputBorder.none,
      //  prefixIcon: prefixIcon,
      //prefix: ,
      prefixIcon: prefixIcon,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      hintText: labelText,
      counterText: "",
      labelStyle: TextStyle(
        color: labelTextColor ?? Colors.grey.shade400,
      ),
      hintStyle: TextStyle(
        color: hintColor ?? Colors.grey,
      ),
      floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: enableColor ?? textFieldBorderColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: disabledColor ?? textFieldBorderColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: focusedColor ?? textFieldBorderColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
    );
  }
}
