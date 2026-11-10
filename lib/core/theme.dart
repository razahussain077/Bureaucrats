import 'package:flutter/material.dart';
class AppTheme {
  static const navy = Color(0xFF102A43);
  static const blue = Color(0xFF1769AA);
  static const canvas = Color(0xFFF5F8FC);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.light);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(primary: blue, surface: Colors.white),
      scaffoldBackgroundColor: canvas,
      textTheme: ThemeData.light().textTheme.apply(bodyColor: navy, displayColor: navy),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFD9E2EC))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFD9E2EC))),
      ),
    );
  }
}
