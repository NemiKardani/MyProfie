import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_profile/theme/color/colors.dart';

/// [NkGetXFontStyle] USE CUSTOM FONT

class NkGetXFontStyle {
  static TextTheme get primaryTextTheme => ThemeData().textTheme.apply(
        fontFamily: GoogleFonts.lexend(color: primaryTextColor).fontFamily,
      );
}
