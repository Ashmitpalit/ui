import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanionFinderScreen extends StatelessWidget {
  const CompanionFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/header_illustration.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12),
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
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [
                      CompanionCard(
                        icon: Icons.sports_soccer,
                        title: 'Sports Companion',
                        description: 'Find friends to play sports together',
                        color: Color(0xFFFFF3CD),
                      ),
                      SizedBox(height: 16),
                      CompanionCard(
                        icon: Icons.restaurant,
                        title: 'Food Companion',
                        description: 'Discover foodie buddies around you',
                        color: Color(0xFFFFE5B4),
                      ),
                      SizedBox(height: 16),
                      CompanionCard(
                        icon: Icons.travel_explore,
                        title: 'Travel Companion',
                        description: 'Meet travel partners for new adventures',
                        color: Color(0xFFE0F7FA),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.person, size: 28, color: Colors.black87),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => const ProfileBottomSheet(),
                ),
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
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
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
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.3,
      maxChildSize: 0.65,
      expand: false,
      builder: (_, controller) => Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          controller: controller,
          children: const [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Ashmit Palit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'ashmit@example.com',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Text(
                '+91 9876543210',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
