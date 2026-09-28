import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFF5252);
  static const Color secondary = Color(0xFFFFD740);
  static const Color background = Color(0xFF180C0C);
  static const Color surface = Color(0xFF2A1414);
  static const Color card = Color(0xFF3C1C1C);
  static const Color textPrimary = Color(0xFFF0F4F8);
  static const Color textSecondary = Color(0xFF90A4AE);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      cardTheme: const CardThemeData(
        color: card,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primary.withValues(alpha: 0.25),
      ),
    );
  }
}
