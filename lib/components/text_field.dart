import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const TextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: const Color.fromARGB(255, 101, 123, 102),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
      ),
    );
  }
}
