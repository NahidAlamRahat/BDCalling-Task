import 'package:bd_calling_task/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../widget/text_description_widget.dart';
import '../../widget/title_text_widget.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // controller initialize
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsAnimationPath.carAnimation, height: 260),
              TitleTextWidget(title: 'Theory test in my language'),
              const SizedBox(height: 16),
              TextDescriptionWidget(
                description:
                'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
              ),
              const Spacer(),
              Lottie.asset(
                AssetsAnimationPath.loadingAnimation,
                height: 110,
                width: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
