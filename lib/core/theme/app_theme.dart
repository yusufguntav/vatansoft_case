// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../variables/color_table.dart';
import '../variables/enums.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
      fontFamily: CustomFonts.rickAndMorty.font,
    )),
    primaryColor: ColorTable.primaryColor,
    useMaterial3: false,
    primaryColorLight: ColorTable.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      primary: ColorTable.primaryColor,
      secondary: const Color.fromARGB(30, 53, 56, 151),
    ),
    iconTheme: IconThemeData(color: ColorTable.primaryColor),
  );

  static ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
      fontFamily: CustomFonts.rickAndMorty.font,
    )),
    cardColor: ColorTable.primaryColorDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: ColorTable.primaryColorDark,
      secondary: ColorTable.primaryColorDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: ColorTable.primaryColorDark),
    scaffoldBackgroundColor: ColorTable.scaffoldColorDark,
  );
}
