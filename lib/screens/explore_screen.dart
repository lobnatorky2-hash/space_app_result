import 'package:flutter/material.dart';
import '../data/planets_data.dart';
import 'details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _controller = PageController(viewportFraction: 0.65);
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    if (index < 0 || index >= planets.length) return;
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[_currentIndex];

    return Scaffold(
      body: Column(
        children: [
          // الهيدر: صورة + gradient + عناوين
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/mars.png', fit: BoxFit.cover),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xFF0E0E0E)],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Explore',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Which planet\nwould you like to explore?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // الـ PageView
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: planets.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, i) {
                final focused = i == _currentIndex;
                return AnimatedScale(
                  scale: focused ? 1.0 : 0.7,
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(planets[i].image, fit: BoxFit.contain),
                );
              },
            ),
          ),

          // الأزرار + اسم الكوكب
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ArrowButton(
                  icon: Icons.arrow_back,
                  onPressed: () => _goToPage(_currentIndex - 1),
                ),
                Text(
                  planet.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _ArrowButton(
                  icon: Icons.arrow_forward,
                  onPressed: () => _goToPage(_currentIndex + 1),
                ),
              ],
            ),
          ),

          // زرار Explore
          Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              top: false,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(planet: planet),
                      ),
                    );
                  },
                  child: Text('Explore ${planet.name}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
      child: Icon(icon, size: 22),
    );
  }
}