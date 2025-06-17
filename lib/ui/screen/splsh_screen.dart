import 'package:bd_calling_task/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../widget/onboarding_page_widget.dart';
import '../widget/text_description_widget.dart';
import '../widget/title_text_widget.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsAnimationPath.carAnimation,height: 260),
              // const SizedBox(height: 16),
              TitleTextWidget(title: 'Theory test in my language',),
              const SizedBox(height: 16),
              TextDescriptionWidget(description: 'I must write the real test will be in English language and this app just helps you to understand the materials in your language'),
              const Spacer(),
              const CircularProgressIndicator(),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _moveToNextScreen()async{
    await  Future.delayed(const Duration(seconds: 5),);
    Get.toNamed(OnboardingScreen.name);
  }

}
