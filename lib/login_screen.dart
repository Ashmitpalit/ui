import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'companion_finder_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedDocument;
  final ImagePicker _picker = ImagePicker();
  bool _showDropdownError = false;

  Future<void> _pickImage() async {
    if (selectedDocument == null) {
      setState(() => _showDropdownError = true);
      return;
    }

    setState(() => _showDropdownError = false);

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected file: ${pickedFile.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 240,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/try_bg.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Login to Companion Finder',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _showDropdownError ? Colors.red : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDocument,
                  decoration: InputDecoration(
                    hintText: 'Select document type',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_drop_down),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  items: const [
                    DropdownMenuItem(value: 'Aadhaar', child: Text('Aadhaar')),
                    DropdownMenuItem(value: 'PAN', child: Text('PAN')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDocument = value;
                      _showDropdownError = false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Name'),
              const SizedBox(height: 16),
              _buildTextField('Email'),
              const SizedBox(height: 16),
              _buildTextField('Password', obscure: true),
              const SizedBox(height: 24),
              _buildButton(
                icon: Icons.qr_code_scanner,
                label: 'Scan ${selectedDocument ?? "Document"}',
                onTap: _pickImage,
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 12),
              _buildButton(
                icon: Icons.fingerprint,
                label: 'Authorize Biometric',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Biometric authorization tapped'),
                    ),
                  );
                },
                color: Colors.lightBlueAccent,
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
                color: Colors.tealAccent.shade700,
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
          borderSide: BorderSide.none,
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
