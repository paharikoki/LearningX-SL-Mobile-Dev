// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData prefixIcon;
  final String label;
  final String hintText;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.prefixIcon,
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(prefixIcon),
                labelText: label,
                hintText: hintText,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
