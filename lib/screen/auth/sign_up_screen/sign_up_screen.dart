import 'package:bd_calling_task/assets_path.dart';
import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:bd_calling_task/screen/auth/sign_up_screen/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/showCustomDialog.dart';
import 'controller/sign_up_controller.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Initialize product_list_screen
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.064, // 24px on 375px width
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const SignUpHeader(),

                SizedBox(height: screenHeight * 0.04),

                // Form
                SignUpForm(controller: controller),

                SizedBox(height: screenHeight * 0.03),

                // Sign Up Button
                SignUpButton(
                  onPressed: () {
                    controller.signUp(
                      context,
                          () => _showSuccessDialog(context),
                    );
                  },
                ),

                SizedBox(height: screenHeight * 0.02),

                // Sign In Link
                const SignInLink(),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showCustomDialog(
      context: context,
      title: 'Successfully Registered',
      description:
      "'Your account has been registered successfully, now let\'s enjoy our features!'",
      buttonText: 'Continue',
      animationPath: AssetsAnimationPath.completeAnimation,
      onPressed: () {
        Get.offAllNamed(AppRoutes.signInScreen);
      },
    );
  }
}