import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          shadowColor: colorScheme.primary,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryContainer,
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 28.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 21.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray50,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3F000000),
    primaryContainer: Color(0XFF131825),
    secondaryContainer: Color(0XFF5F6368),

    // Error colors
    errorContainer: Color(0XFF9A8D8D),
    onError: Color(0XFFE0E0E0),
    onErrorContainer: Color(0XFF0F172A),

    // On colors(text colors)
    onPrimary: Color(0XFF1E293B),
    onPrimaryContainer: Color(0XFF949494),
    onSecondaryContainer: Color(0XFF06102B),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Blue
  Color get blue600 => Color(0XFF1A73E8);

  // BlueGray
  Color get blueGray700 => Color(0XFF475569);
  Color get blueGray800 => Color(0XFF334155);
  Color get blueGray900 => Color(0XFF2F343F);

  // Cyan
  Color get cyan50 => Color(0XFFD7F3FD);

  // Gray
  Color get gray50 => Color(0XFFF8FAFC);
  Color get gray5001 => Color(0XFFF9FBFC);
  Color get gray900 => Color(0XFF1E1E1E);

  // Indigo
  Color get indigo50 => Color(0XFFE8EDFB);

  // LightBlue
  Color get lightBlue400 => Color(0XFF20BFF5);

  // Red
  Color get red500 => Color(0XFFEF4444);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
