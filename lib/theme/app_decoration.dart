import 'package:flutter/material.dart';
import 'package:secure_notes/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red500,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientLightBlueToWhiteA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -0.06),
          end: Alignment(0.91, 1),
          colors: [
            appTheme.lightBlue400,
            appTheme.whiteA700,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.blue600,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.cyan50,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderLR5 => BorderRadius.horizontal(
        right: Radius.circular(5.h),
      );
  static BorderRadius get customBorderTL5 => BorderRadius.horizontal(
        left: Radius.circular(5.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
