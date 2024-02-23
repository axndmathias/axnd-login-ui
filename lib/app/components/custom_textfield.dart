import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final dynamic controller;
  final String hinText;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hinText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hinText),
      ),
    );
  }
}
