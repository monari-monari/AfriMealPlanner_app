import 'package:flutter/material.dart';

class AppTheme {
  // Primary color representing African warmth and vitality
  static const Color primaryColor = Color(0xFFE9442C); // A vibrant burnt orange/red
  static const Color accentColor = Color(0xFF4CAF50); // Green for growth/nutrition

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(0xFFE9442C, {
        50: Color(0xFFFDE4E1),
        100: Color(0xFFF9C0B8),
        200: Color(0xFFF5948A),
        300: Color(0xFFF1685C),
        400: Color(0xFFED453D),
        500: primaryColor,
        600: Color(0xFFD43825),
        700: Color(0xFFBF301F),
        800: Color(0xFFA82819),
        900: Color(0xFF8C1D10),
      }),
      accentColor: accentColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    ),
    // ... other theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      surface: Colors.grey[850]!,
      background: Colors.grey[900]!,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    // ... other dark theme properties
  );
}