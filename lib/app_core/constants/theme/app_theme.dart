import 'package:flutter/material.dart';
import 'package:shop/app_core/constants/strings/fixed_theme_color.dart';

class ThemeConfigurationContoller {
  ThemeData lightThemeData = ThemeData(
    fontFamily: 'yb',
    primaryColor: FixedThemeColor.primaryColor,
    scaffoldBackgroundColor: FixedThemeColor.scaffoldBackgroundColor,
    dividerColor: FixedThemeColor.dividerColor,
    hintColor: FixedThemeColor.hintColor,
  );
}
