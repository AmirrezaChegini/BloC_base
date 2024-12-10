import 'package:bloc_base/core/utils/check_theme.dart';
import 'package:bloc_base/core/utils/context_provider.dart';
import 'package:flutter/material.dart';
import 'package:bloc_base/common_ui/resources/my_colors.dart';

class MyTheme {
  static const MyTheme _i = MyTheme._internal();

  const MyTheme._internal();

  factory MyTheme() => _i;

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
  );

  static Map<String, Color> get lightColors => {
        'primary_color': MyColors.white,
      };

  static Map<String, Color> get darkColors => {
        'primary_color': MyColors.black,
      };
}

extension ThemeExtension on ThemeData {
  Map<String, Color> get customColors =>
      ContextProvider.context!.isDarkMode ? MyTheme.darkColors : MyTheme.lightColors;

  Color get primaryColor => customColors['primary_color']!;
}
