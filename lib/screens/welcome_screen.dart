import 'package:flutter/material.dart';
import 'explore_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الطبقة 1: الصورة بتملى الشاشة
          Positioned.fill(
            child: Image.asset(
              'assets/images/mars.png', // غيّري الاسم لصورة الخلفية عندك
              fit: BoxFit.cover,
            ),
          ),

          // الطبقة 2: العنوان في النص
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Explore\nThe Universe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // الطبقة 3: الزرار تحت
          Positioned(
            left: 16,
            right: 16,
            bottom: 32,
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ExploreScreen()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Explore'),
                    Icon(Icons.arrow_right_alt, size: 22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}