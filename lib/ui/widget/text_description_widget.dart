import 'package:flutter/material.dart';

class TextDescriptionWidget extends StatelessWidget {
  const TextDescriptionWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      description,
      style: textTheme.titleSmall,
      textAlign: TextAlign.center,
    );
  }
}
