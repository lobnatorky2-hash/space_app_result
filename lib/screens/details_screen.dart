import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import '../models/planet.dart';

class DetailsScreen extends StatelessWidget {
  final Planet planet;

  const DetailsScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(planet.image, fit: BoxFit.cover),
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
                              planet.name,
                              style: textTheme.titleLarge,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _BackButton(
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              planet.title,
                              style: textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Flutter3DViewer(
                src: planet.model3d,
                onError: (error) => debugPrint('3D ERROR: $error'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(planet.about, style: textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  _InfoRow(
                    label: 'Distance from Sun (km)',
                    value: planet.distanceFromSun,
                  ),
                  _InfoRow(
                    label: 'Length of Day (hours)',
                    value: planet.lengthOfDay,
                  ),
                  _InfoRow(
                    label: 'Orbital Period (Earth years)',
                    value: planet.orbitalPeriod,
                  ),
                  _InfoRow(label: 'Radius (km)', value: planet.radius),
                  _InfoRow(label: 'Mass (kg)', value: planet.mass),
                  _InfoRow(label: 'Gravity (m/s²)', value: planet.gravity),
                  _InfoRow(
                    label: 'Surface Area (km²)',
                    value: planet.surfaceArea,
                    showDivider: false,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _BackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFEE403D),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.arrow_back, size: 22, color: Colors.white),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showDivider;

  const _InfoRow({
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(label, style: textTheme.bodyLarge)),
              const SizedBox(width: 16),
              Text(
                value,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(color: Colors.white24, height: 1),
      ],
    );
  }
}