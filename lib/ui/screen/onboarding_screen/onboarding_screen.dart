import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:bd_calling_task/ui/widget/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widget/app_size.dart';
import '../../widget/onboarding_page_widget.dart';
import 'controller/onboarding_screen_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  static const String name = '/onboarding';

  final PageController _pageController = PageController();
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    // Initialize responsive utils
    AppSize.size = MediaQuery.of(context).size;
    ResponsiveUtils.initialize(context);

    final padding = MediaQuery.of(context).padding;
    final bottomSafeArea = padding.bottom;

    // Responsive paddings & sizes
    final buttonBottomPadding = bottomSafeArea > 0 ? bottomSafeArea + 16 : AppSize.height(value: 40);
    final indicatorBottomPosition = buttonBottomPadding + AppSize.height(value: 56) + AppSize.height(value: 24);
    final horizontalPadding = AppSize.width(value: 20);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // PageView
            PageView.builder(
              controller: _pageController,
              itemCount: controller.pages.length,
              onPageChanged: controller.changePage,
              itemBuilder: (context, index) {
                final p = controller.pages[index];
                return OnboardingPageWidget(
                  title: p["title"]!,
                  description: p["description"]!,
                  lottieAsset: p["lottie"]!,
                );
              },
            ),

            // Indicator
            Positioned(
              bottom: indicatorBottomPosition,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: controller.pages.length,
                  effect: WormEffect(
                    dotHeight: AppSize.height(value: 10),
                    dotWidth: AppSize.height(value: 10),
                    activeDotColor: const Color.fromRGBO(27, 110, 247, 1),
                  ),
                ),
              ),
            ),

            // Button
            Positioned(
              bottom: buttonBottomPadding,
              left: horizontalPadding,
              right: horizontalPadding,
              child: Obx(() {
                final isLast = controller.currentPage.value == controller.pages.length - 1;
                return ButtonWidget(
                  buttonHeight: AppSize.height(value: 60),
                  buttonRadius: BorderRadius.circular(AppSize.height(value: 30)),
                  backgroundColor: const Color.fromRGBO(27, 110, 247, 1),
                  onPressed: () {
                    if (isLast) {
                      Get.offNamed(AppRoutes.signInScreen);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  label: isLast ? 'Get Started' : 'Next',
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
