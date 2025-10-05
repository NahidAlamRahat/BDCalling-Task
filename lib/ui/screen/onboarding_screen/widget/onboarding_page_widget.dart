import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/text_description_widget.dart';
import '../../../widget/title_text_widget.dart';
import '../../../widget/app_size.dart';

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
    return SizedBox(
      height: AppSize.size.height, // full screen height use koro
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // content upore thakbe
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.height(value: 80)), // bigger top gap

            // Lottie animation
            Lottie.asset(
              lottieAsset,
              height: AppSize.height(value: 300), // little smaller for balance
              width: AppSize.width(value: 300),
            ),

            SizedBox(height: AppSize.height(value: 40)),

            // Title
            TitleTextWidget(title: title),

            SizedBox(height: AppSize.height(value: 20)),

            // Description
            TextDescriptionWidget(description: description),

            // jodi niche space fill korte chao -> Expanded deya jabe
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
