import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    required TextEditingController textController,
    required this.maxLength,
    required this.title,
    this.currencyInit,
  }) : _textController = textController;

  final TextEditingController _textController;
  final TextInputType keyboardType;
  final int maxLength;
  final String title;
  final String? currencyInit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(title, style: const TextStyle(fontSize: 14)),
        suffixText: currencyInit,
        suffixStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
      keyboardType: keyboardType,
    );
  }
}
