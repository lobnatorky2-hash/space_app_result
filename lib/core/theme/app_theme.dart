import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF0E0E0E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFEE403D);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    colorScheme: const ColorScheme.dark(primary: red, surface: black),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        foregroundColor: white,
        elevation: 0,
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}