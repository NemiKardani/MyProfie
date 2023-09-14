import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/theme/color/colors.dart';

class MyRegularText extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? stepGranularity;
  final TextStyle? style;
  final bool showEmptyError;
  final TextDecorationStyle? textDecorationStyle;

  const MyRegularText({
    Key? key,
    required this.label,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.align = TextAlign.center,
    this.maxlines,
    this.decoration = TextDecoration.none,
    this.overflow = TextOverflow.ellipsis,
    this.letterSpacing,
    this.stepGranularity,
    this.style,
    this.textDecorationStyle,
    this.showEmptyError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*  ThemeData theme = Get.theme; */
    return label.isNotEmpty || showEmptyError == false
        ? Text(label.isNotEmpty ? label : '',
            textAlign: align,
            maxLines: maxlines ?? 1,
            softWrap: true,
            //minFontSize: 12,
            overflow: overflow,
            style: style ??
                TextStyle(
                  color: color ?? primaryColor,
                  decorationStyle: textDecorationStyle,
                  fontSize: context.textScaleFactor * (fontSize ?? 14),
                  letterSpacing: letterSpacing,
                  fontWeight: fontWeight ?? FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  decoration: decoration,
                  //decorationColor: theme.de,
                  decorationThickness: 1,
                ))
        : ErrorWidget.withDetails(
            message: "PLEASE DO NOT EMPTY LIABLE",
            error: FlutterError("PLEASE DO NOT EMPTY LIABLE"),
          );
  }
}
