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
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFEAF3FB),
        labelTextStyle: WidgetStateProperty.resolveWith((states) => TextStyle(
          fontSize: 10,
          fontWeight: states.contains(WidgetState.selected) ? FontWeight.w800 : FontWeight.w600,
          color: states.contains(WidgetState.selected) ? blue : const Color(0xFF718096),
        )),
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: blue,
        unselectedLabelColor: Color(0xFF718096),
        labelStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        indicatorColor: blue,
        dividerColor: Color(0xFFE6EDF4),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
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
