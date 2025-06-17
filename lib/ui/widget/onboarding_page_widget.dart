import 'package:bd_calling_task/ui/widget/text_description_widget.dart';
import 'package:bd_calling_task/ui/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String lottieAsset;

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.lottieAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottieAsset, height: 260),
          const SizedBox(height: 24),
          TitleTextWidget(title: title),
          const SizedBox(height: 16),
          TextDescriptionWidget(description: description),
        ],
      ),
    );
  }
}


