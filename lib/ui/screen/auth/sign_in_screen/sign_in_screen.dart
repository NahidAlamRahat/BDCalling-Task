import 'package:bd_calling_task/assets_path.dart';
import 'package:bd_calling_task/ui/screen/auth/sign_in_screen/widget/sign_in_form_widget.dart';
import 'package:bd_calling_task/ui/screen/auth/sign_in_screen/widget/sign_in_logo.dart';
import 'package:bd_calling_task/ui/screen/auth/sign_in_screen/widget/sign_in_remember_widget.dart';
import 'package:bd_calling_task/ui/screen/auth/sign_in_screen/widget/welcome_title_widget.dart';
import 'package:bd_calling_task/ui/widget/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_size.dart';
import 'controller/sign_in_screen_controller.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  Widget build(BuildContext context) {
    // Initialize app size
    AppSize.size = MediaQuery.of(context).size;
    ResponsiveUtils.initialize(context);

    // Initialize controller
    final SignInController controller = Get.put(SignInController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(value: 24),
              vertical: AppSize.height(value: 16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppSize.height(value: 40)),

                // Logo
                SignInLogo(logoPath: AssetsImagePath.eduLogo),

                SizedBox(height: AppSize.height(value: 32)),

                // Welcome Title & Description
                const WelcomeTitle(),

                SizedBox(height: AppSize.height(value: 40)),

                // Sign In Form
                SignInForm(controller: controller),

                SizedBox(height: AppSize.height(value: 16)),

                // Remember Me & Forgot Password
                RememberMeRow(controller: controller),

                SizedBox(height: AppSize.height(value: 20)),

                // Sign In Button
                /*SignInButton(onPressed: controller.signIn),*/

                ButtonWidget(
                  label: 'Sign in',
                  buttonWidth: double.infinity,
                  buttonHeight: AppSize.height(value: 56),
                  onPressed: () async {
                    await controller.signIn();
                  },
                  backgroundColor: const Color(0xFF2563EB),
                  textColor: Colors.white,
                  buttonRadius: BorderRadius.circular(100),
                ),


                SizedBox(height: AppSize.height(value: 20)),

                // Sign Up Link
                const SignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}