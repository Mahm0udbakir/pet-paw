import 'package:flutter/material.dart';

class PasswordStrengthLabel extends StatelessWidget {
  final int passedCount;

  const PasswordStrengthLabel({super.key, required this.passedCount});

  @override
  Widget build(BuildContext context) {
    String strengthText;
    Color strengthColor;

    if (passedCount <= 2) {
      strengthText = 'Weak Password!';
      strengthColor = Colors.red;
    } else if (passedCount <= 4) {
      strengthText = 'Normal Password!';
      strengthColor = Colors.orange;
    } else {
      strengthText = 'Strong Password!';
      strengthColor = Colors.green;
    }

    return Text(
      strengthText,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: strengthColor,
      ),
    );
  }
}
