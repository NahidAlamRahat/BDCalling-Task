import 'package:get/get.dart';
import '../../../../assets_path.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  // Onboarding pages data list
  final List<Map<String, String>> pages = [
    {
      "title": "Best online courses in the world",
      "description":
      "Now you can learn, anywhere, even, if there is no internet access",
      "lottie": AssetsAnimationPath.stopAnimation,
    },
    {
      "title": "Explore your new skill today",
      "description":
      "Our platform is designed to help you explore new skill. Let's learn & grow with Eduline!",
      "lottie": AssetsAnimationPath.warningAnimation,
    },
  ];
}
