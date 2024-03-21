// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../variables/color_table.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    primaryColor: ColorTable.primaryColor,
    colorScheme: ColorScheme.light(
      primary: ColorTable.primaryColor,
      secondary: ColorTable.primaryColor,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: false,
    primaryColor: ColorTable.primaryColorDark,
    colorScheme: ColorScheme.light(
      primary: ColorTable.primaryColorDark,
      secondary: ColorTable.primaryColorDark,
    ),
  );
}
