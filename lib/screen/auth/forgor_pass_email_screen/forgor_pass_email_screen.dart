import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../widget/app_size.dart';
import '../../../widget/button_widget/button_widget.dart';
import 'controller/forgot_pass_email_controller.dart';

class ForgotPassEmailScreen extends StatefulWidget {
  const ForgotPassEmailScreen({super.key});
  static String name = 'forgot-pass-email/screen';

  @override
  State<ForgotPassEmailScreen> createState() => _ForgotPassEmailScreenState();
}

class _ForgotPassEmailScreenState extends State<ForgotPassEmailScreen> {
  final ForgotPassEmailController controller = Get.put(ForgotPassEmailController()); // Use product_list_screen

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const baseW = 375.0;
              final w = constraints.maxWidth;
              final scale = (w / baseW).clamp(0.85, 1.35);
              double sw(num v) => v * scale; // size by width
              double fs(num v) => v * scale; // font size

              const primaryBlue = Color(0xFF2E6BFF);

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sw(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw(4)),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: sw(20), color: Colors.black87),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Get.back(),
                    ),
                    SizedBox(height: sw(12)),
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: fs(20),
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: sw(6)),
                    Center(
                      child: Text(
                        'Enter your email, we will send a\nverification code to email.',
                        style: TextStyle(
                          fontSize: fs(12),
                          color: const Color(0xFF8C8C8C),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: sw(28)),
                    _buildLabel('Email Address'),
                    Form(
                      key: controller.formKey, // Add the formKey here
                      child: _buildEmailField(controller.emailController), // Use the controller here
                    ),
                    SizedBox(height: sw(24)),
                    ButtonWidget(
                      label: 'Continue',
                      buttonWidth: double.infinity,
                      buttonHeight: AppSize.height(value: 56),
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.toNamed(AppRoutes.recoverResetPasswordScreen);
                        }
                      },
                      backgroundColor: const Color(0xFF2563EB),
                      textColor: Colors.white,
                      buttonRadius: BorderRadius.circular(100),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppSize.width(value: 14),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF1E293B),
      ),
    );
  }

  Widget _buildEmailField(TextEditingController Tecontroller) { // Pass the product_list_screen to this widget
    return TextFormField(
      autovalidateMode:  AutovalidateMode.onUserInteraction,
      controller: Tecontroller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontSize: AppSize.width(value: 15),
        color: const Color(0xFF1E293B),
      ),
      decoration: _inputDecoration('Enter Your Email'),
      validator: controller.validateEmail,
    );
  }

  InputDecoration _inputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: AppSize.width(value: 15),
        color: const Color(0xFF94A3B8),
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSize.width(value: 20),
        vertical: AppSize.height(value: 14),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Color(0xFF2563EB),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Color(0xFFEF4444),
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Color(0xFFEF4444),
          width: 1,
        ),
      ),
      errorStyle: TextStyle(
        fontSize: AppSize.width(value: 12),
        color: const Color(0xFFEF4444),
        height: 1.2,
      ),
      suffixIcon: suffixIcon,
    );
  }
}
