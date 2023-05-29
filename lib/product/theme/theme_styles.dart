import 'package:flutter/material.dart';

class ThemeStyles {
  // DARK THEME
  static ThemeData darkTheme(BuildContext context) => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(colorScheme: _colorSchemeDark);

  // LIGHT THEME
  static ThemeData lightTheme(BuildContext context) => ThemeData.light(
        useMaterial3: true,
      ).copyWith(colorScheme: _colorSchemeLight);

  static get _colorSchemeLight => const ColorScheme.light();

  static get _colorSchemeDark => const ColorScheme.dark();
}
