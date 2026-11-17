import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showMessage(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
