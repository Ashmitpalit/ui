import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Companion Finder',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const CompanionFinderScreen(),
    );
  }
}

class CompanionFinderScreen extends StatelessWidget {
  const CompanionFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Big illustration header
            SizedBox(
              height: 220,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/header_illustration.svg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your Companion',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Choose the type of companion you want to connect with',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  CompanionCard(
                    icon: Icons.sports_soccer,
                    title: 'Sports Companion',
                    description: 'Find friends to play sports together',
                    color: Color(0xFFFFE082),
                  ),
                  SizedBox(height: 16),
                  CompanionCard(
                    icon: Icons.restaurant,
                    title: 'Food Companion',
                    description: 'Discover foodie buddies around you',
                    color: Color(0xFFFFCC80),
                  ),
                  SizedBox(height: 16),
                  CompanionCard(
                    icon: Icons.travel_explore,
                    title: 'Travel Companion',
                    description: 'Meet travel partners for new adventures',
                    color: Color(0xFF80DEEA),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const CompanionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // You can navigate to the details screen here
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, size: 28, color: Colors.black87),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
