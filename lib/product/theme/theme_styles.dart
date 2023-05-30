import 'package:flutter/material.dart';

class ThemeStyles {
  static Color pinkColor = const Color(0xffC293EB);
  // DARK THEME
  static ThemeData darkTheme(BuildContext context) => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        primaryColor: pinkColor,
        colorScheme: _colorSchemeDark,
        cardTheme: const CardTheme(color: Color(0xff3A1D5C))
      );

  // LIGHT THEME
  static ThemeData lightTheme(BuildContext context) => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        primaryColor: pinkColor,
        colorScheme: _colorSchemeLight,
        cardTheme: const CardTheme(color: Color(0xff3A1D5C))
      );

  static get _colorSchemeLight => const ColorScheme.light();

  static get _colorSchemeDark =>  ColorScheme.fromSeed(seedColor: const Color(0xff847BDD));
}
