import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:my_profile/theme/font_style.dart';

class NkGetXTheme {
  static ThemeData get lightTheme => ThemeData(
      shadowColor: shadowColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorDark: primaryColor,
      cardTheme: CardTheme(
          shadowColor: shadowColor,
          color: primaryContainerColor,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      scaffoldBackgroundColor: backgroundColor,
      navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(NkGetXFontStyle
              .primaryTextTheme.labelMedium
              ?.copyWith(fontSize: 16)),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          backgroundColor: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedLabelStyle: NkGetXFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: primaryTextColor),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: NkGetXFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: primaryTextColor)),
      appBarTheme: appBarTheme,
      textTheme: NkGetXFontStyle.primaryTextTheme,
      primaryTextTheme: NkGetXFontStyle.primaryTextTheme,
      dividerColor: dividerColor,
      listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0)),
      expansionTileTheme: const ExpansionTileThemeData(
          iconColor: primaryColor,
          textColor: primaryTextColor,
          collapsedTextColor: primaryTextColor,
          tilePadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          childrenPadding: EdgeInsets.zero),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        error: errorColor,
        onError: errorColor,
        background: backgroundColor,
        onBackground: backgroundColor,
        primaryContainer: primaryContainerColor,
        onSecondary: secondaryColor,
        secondaryContainer: secondaryColor,
        surface: backgroundColor,
        secondary: secondaryColor,
      ),
      iconTheme: const IconThemeData(color: primaryIconColor, size: 26),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: secondaryTextColor,
        selectionColor: cursorColor,
        selectionHandleColor: primaryButtonColor,
      ),
      useMaterial3: true,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(primaryIconColor))),
      primaryIconTheme: const IconThemeData(color: primaryIconColor, size: 24),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          buttonColor: primaryButtonColor,
          textTheme: ButtonTextTheme.normal,
          padding: const EdgeInsets.all(16.0),
          height: 42,
          disabledColor: primaryButtonColor,
          focusColor: primaryButtonColor,
          layoutBehavior: ButtonBarLayoutBehavior.padded,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )));

  static AppBarTheme get appBarTheme => const AppBarTheme(
      color: backgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      shadowColor: shadowColor,
      centerTitle: true,
      titleTextStyle: TextStyle());

  static get systemChromeStyle =>
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
}
