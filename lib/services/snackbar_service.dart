import 'package:flutter/material.dart';

class SnackBarService {
  BuildContext? _buildContext;

  static SnackBarService instance = SnackBarService();

  SnackBarService();

  set buildContext(BuildContext context) {
    _buildContext = context;
  }

  void showSnackBar(String message, bool success) {
    ScaffoldMessenger.of(_buildContext!).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          backgroundColor: success
              ? Color.fromARGB(255, 43, 61, 44)
              : Color.fromARGB(255, 126, 194, 0)),
    );
  }
}
