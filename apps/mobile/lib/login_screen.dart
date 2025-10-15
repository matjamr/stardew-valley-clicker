import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2E1F1A), // deep earthy
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            elevation: 12,
            color: const Color(0xFF3B2A24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Stardew Clicker',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFFFFE7A0),
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _Field(
                      controller: _usernameController,
                      label: 'Farmer Name',
                      icon: Icons.person,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Please enter your name'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    _Field(
                      controller: _passwordController,
                      label: 'Secret Code',
                      icon: Icons.lock,
                      obscure: true,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Enter a secret code'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8BC34A),
                          foregroundColor: const Color(0xFF1B1B1B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/islands');
                          }
                        },
                        child: const Text('Enter the Valley'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscure;
  final String? Function(String?)? validator;

  const _Field({
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Color(0xFFFFF3C4)),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF4A372F),
        prefixIcon: Icon(icon, color: const Color(0xFFFFE7A0)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFFFE7A0)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFFFE7A0), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
