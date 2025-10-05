import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../onboarding_screen/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.toNamed(AppRoutes.onboardingScreen);
  }
}
