import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900.withOpacity(0.8),
      );
  static get bodyMediumGray900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyMediumff475569 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF475569),
      );
  static get bodySmallInterOnErrorContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  // Label text style
  static get labelLargeInterBluegray700 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray700,
      );
  static get labelLargeRobotoBlue600 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeRobotoSecondaryContainer =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeErrorContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
