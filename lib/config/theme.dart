import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF181C25);
  static const Color surface = Color(0xFF262E3B);
  static const Color accent = Color(0xFFE8CA4E);
  
  static const Color exotic = Color(0xFFF5DC56);
  static const Color legendary = Color(0xFF522F65);
  static const Color rare = Color(0xFF5076A3);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
      ),
      cardColor: surface,
    );
  }
}