import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/companion_finder_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedDocument = 'Aadhaar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SVG illustration header
              SizedBox(
                height: 200,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/login_bg.svg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Login to Companion Finder',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedDocument,
                    items: const [
                      DropdownMenuItem(
                        value: 'Aadhaar',
                        child: Text('Aadhaar'),
                      ),
                      DropdownMenuItem(value: 'PAN', child: Text('PAN')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedDocument = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField('Name'),
              const SizedBox(height: 16),
              _buildTextField('Email'),
              const SizedBox(height: 16),
              _buildTextField('Password', obscure: true),
              const SizedBox(height: 24),
              _buildButton(
                icon: Icons.qr_code_scanner,
                label: 'Scan $selectedDocument',
                onTap: () {
                  // Placeholder for scan action
                },
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 12),
              _buildButton(
                icon: Icons.fingerprint,
                label: 'Authorize Biometric',
                onTap: () {
                  // Placeholder for biometric action
                },
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 12),
              _buildButton(
                icon: Icons.skip_next,
                label: 'Bypass Protocol',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CompanionFinderScreen(),
                    ),
                  );
                },
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
