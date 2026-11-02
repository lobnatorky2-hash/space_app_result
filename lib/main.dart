import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space App',
      theme: AppTheme.darkTheme,
      home: const WelcomeScreen(),
    );
  }
}
