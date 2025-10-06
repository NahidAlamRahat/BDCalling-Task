import 'package:get/get.dart';
import '../screen/splashSCreen/controller/splash_screen_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    // Get.lazyPut(() => ApplicationDetailsController());

  }
}
