import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final String hintText;
  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.inputType,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        label: Text(label),
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
