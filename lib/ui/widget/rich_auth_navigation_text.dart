import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichAuthNavigationText extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback onTap;

  const RichAuthNavigationText({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: leadingText,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: ' $actionText',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
