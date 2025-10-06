import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screen/auth/forgor_pass_email_screen/forgor_pass_email_screen.dart';
import '../screen/auth/recover_reset_password_screen/recover_reset_password_screen.dart';
import '../screen/auth/sign_in_screen/sign_in_screen.dart';
import '../screen/auth/sign_up_screen/sign_up_screen.dart';
import '../screen/auth/verify_otp_screen/verify_otp_screen.dart';
import '../screen/onboarding_screen/onboarding_screen.dart';
import '../screen/product_list_screen/product_list_screen.dart';
import '../screen/splashSCreen/splsh_screen.dart';
import 'app_routes.dart';

class RouteManager {
  RouteManager._();

  static const initial = AppRoutes.splashScreen;

  static List<GetPage> getPages() {
    return [
      // General Screens
      GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
         // binding: SplashController(),
      ),

      GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => OnboardingScreen(),
        // binding: SplashController(),
      ),

      GetPage(
        name: AppRoutes.signInScreen,
        page: () => SignInScreen(),
        // binding: SplashController(),
      ),
      GetPage(
        name: AppRoutes.signUpScreen,
        page: () => SignUpScreen(),
        // binding: SplashController(),
      ),

      GetPage(
        name: AppRoutes.forgotPassEmailScreen,
        page: () => ForgotPassEmailScreen(),
        // binding: SplashController(),
      ),

      GetPage(
        name: AppRoutes.recoverResetPasswordScreen,
        page: () => RecoverResetPasswordScreen(),
        // binding: SplashController(),
      ),
      GetPage(
        name: AppRoutes.verifyOtpScreen,
        page: () => VerifyOtpScreenOtp(),
        // binding: SplashController(),
      ),
      GetPage(
        name: AppRoutes.productListScreen,
        page: () => ProductListScreen(),
        // binding: SplashController(),
      ),




    ];
  }
}
