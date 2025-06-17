import 'package:bd_calling_task/ui/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../assets_path.dart';
import '../controller/onboarding_controller.dart';
import '../widget/onboarding_page_widget.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  static const String name = '/onboarding';

  final PageController _pageController = PageController();
  final controller = Get.put(OnboardingController());

  final List<dynamic> pages = [
    {
      "title": "Best online courses in the world",
      "description":
          "Now you can learn, anywhere, even, if there is no internet access",
      "lottie": AssetsAnimationPath.stopAnimation,
    },
    {
      "title": "Explore your new skill today",
      "description":
          "our platform is designed to help you explore new skill . Let's learn & grow with Eduline!",
      "lottie": AssetsAnimationPath.warningAnimation,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: controller.changePage,
            itemBuilder: (context, index) {
              final p = pages[index];
              return OnboardingPageWidget(
                title: p["title"]!,
                description: p["description"]!,
                lottieAsset: p["lottie"]!,
              );
            },
          ),

          // Indicator
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: const WormEffect(dotHeight: 10, dotWidth: 10),
              ),
            ),
          ),

          // Button
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Obx(() {
              final isLast = controller.currentPage.value == pages.length - 1;
              return ElevatedButton(
                onPressed: () {
                  if (isLast) {
                    Get.offNamed(SignInScreen.name);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isLast ? 'Get Started' : 'Next',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
