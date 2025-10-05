import 'package:bd_calling_task/ui/widget/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import 'controller/recover_reset_password_controller.dart';
import '../../../widget/app_size.dart';
import '../verify_otp_screen/verify_otp_screen.dart';
import '../../../widget/CustomButton.dart';
import '../../../widget/text_description_widget.dart';
import '../../../widget/title_text_widget.dart';

class RecoverResetPasswordScreen extends StatelessWidget {
  const RecoverResetPasswordScreen({super.key});

  static String name = 'recover-reset-password-screen';

  @override
  Widget build(BuildContext context) {
    // Get the controller instance
    final controller = Get.put(RecoverResetPasswordController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(child: const TitleTextWidget(title: 'Reset Password')),
              const SizedBox(height: 8),
              const TextDescriptionWidget(
                description:
                'Your password must be at least 8 characters long and include a combination of letters, numbers.',
              ),
              const SizedBox(height: 32),

              _buildForm(controller),

              const SizedBox(height: 16),

              ButtonWidget(
                label: 'Submit',
                buttonWidth: double.infinity,
                buttonHeight: AppSize.height(value: 56),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.toNamed(AppRoutes.verifyOtpScreen);}
                },
                backgroundColor: const Color(0xFF2563EB),
                textColor: Colors.white,
                buttonRadius: BorderRadius.circular(100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(RecoverResetPasswordController controller) {
    return Form(
      key: controller.formKey,  // Using the formKey from the controller
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('New Password'),
          const SizedBox(height: 8),
          _buildPasswordField(controller: controller, TEcontroller: controller.passwordTEController),
          const SizedBox(height: 16),
          _buildLabel('Confirm New Password'),
          _buildPasswordField(controller: controller, TEcontroller: controller.confirmPasswordTEController),
          const SizedBox(height: 8),
        ],
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

  Widget _buildPasswordField({required TEcontroller,controller}) {
    return Obx(() {
      return TextFormField(
        autovalidateMode:  AutovalidateMode.onUserInteraction,
        controller: TEcontroller,
        obscureText: controller.obscurePassword.value,
        style: TextStyle(
          fontSize: AppSize.width(value: 15),
          color: const Color(0xFF1E293B),
        ),
        decoration: _inputDecoration(
          'Enter Your Password',
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscurePassword.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color(0xFF94A3B8),
              size: AppSize.width(value: 20),
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        validator: controller.validatePassword,
      );
    });
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
