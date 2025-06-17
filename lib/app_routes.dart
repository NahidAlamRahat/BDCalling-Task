import 'package:bd_calling_task/ui/screen/forgor_pass_email_screen.dart';
import 'package:bd_calling_task/ui/screen/onboarding_screen.dart';
import 'package:bd_calling_task/ui/screen/product_list_screen.dart';
import 'package:bd_calling_task/ui/screen/recover_reset_password_screen.dart';
import 'package:bd_calling_task/ui/screen/sign_in_screen.dart';
import 'package:bd_calling_task/ui/screen/sign_up_screen.dart';
import 'package:bd_calling_task/ui/screen/splsh_screen.dart';
import 'package:bd_calling_task/ui/screen/verify_otp_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }
    else if (settings.name == OnboardingScreen.name) {
      route = OnboardingScreen();
    }
    else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    }
    else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    }
    else if (settings.name == ProductListScreen.name) {
      route = ProductListScreen();
    }
    else if (settings.name == ForgotPassEmailScreen.name) {
      route = ForgotPassEmailScreen();
    }
    else if (settings.name == RecoverResetPasswordScreen.name) {
      route = RecoverResetPasswordScreen();
    }
    else if (settings.name == VerifyOtpScreenOtp.name) {
      route = VerifyOtpScreenOtp();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}

