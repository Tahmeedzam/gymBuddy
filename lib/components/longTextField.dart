import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // More rounded
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSecondary,
        width: 1.2,
      ),
    );

    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.tertiary,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondary,
        fontFamily: 'Inter',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontFamily: "Inter",
        ),
        enabledBorder: border,
        focusedBorder: border, // same as enabled
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
