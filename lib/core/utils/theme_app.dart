import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/color_app.dart';

class ThemeApp {
  static ThemeData themeDark = ThemeData(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorApp.transparentColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorApp.primaryColor)),
      useMaterial3: true,
      scaffoldBackgroundColor: ColorApp.backgroundApp,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorApp.backgroundApp,
        primary: ColorApp.primaryColor,
        secondary: ColorApp.secondaryColor,
        tertiary: ColorApp.tertiaryColor,
        onSecondary: ColorApp.whiteColor,
        onPrimary: ColorApp.whiteColor,
        onPrimaryContainer: ColorApp.onPrimaryColor,
        primaryContainer: ColorApp.onPrimaryColor,
        outline: ColorApp.outlineColor,
        surface: ColorApp.whiteColor,
        onSurface: ColorApp.blackColor,
        surfaceContainerLow: ColorApp.surfaceContainerLowColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorApp.transparentColor,
          selectedLabelStyle:
              TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          selectedItemColor: ColorApp.onPrimaryColor,
          unselectedItemColor: ColorApp.onPrimaryColor,
          showUnselectedLabels: false,
          enableFeedback: true,
          elevation: 0),
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 24, color: ColorApp.whiteColor),
        titleSmall: TextStyle(fontSize: 20, color: ColorApp.whiteColor),
        labelLarge: TextStyle(fontSize: 22, color: ColorApp.whiteColor),
        labelMedium: TextStyle(fontSize: 18, color: ColorApp.whiteColor),
        labelSmall: TextStyle(fontSize: 14, color: ColorApp.whiteColor),
      ));
}
