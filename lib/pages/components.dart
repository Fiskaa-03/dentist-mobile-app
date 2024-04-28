import 'package:flutter/material.dart';

class AuthComponents extends StatelessWidget {
  const AuthComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  });
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
