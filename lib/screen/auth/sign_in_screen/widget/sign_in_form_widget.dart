import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/app_size.dart';
import '../controller/sign_in_screen_controller.dart';






// Sign In Form Widget
class SignInForm extends StatelessWidget {
  final SignInController controller;

  const SignInForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Field
          _buildLabel('Email Address'),
          SizedBox(height: AppSize.height(value: 10)),
          _buildEmailField(),

          SizedBox(height: AppSize.height(value: 20)),

          // Password Field
          _buildLabel('Password'),
          SizedBox(height: AppSize.height(value: 10)),
          _buildPasswordField(),
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

  Widget _buildEmailField() {
    return TextFormField(
      controller: controller.emailTEController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontSize: AppSize.width(value: 15),
        color: const Color(0xFF1E293B),
      ),
      decoration: _inputDecoration('Enter Your Email'),
      validator: controller.validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return GetBuilder<SignInController>(
      builder: (ctrl) => TextFormField(
        controller: controller.passwordTEController,
        obscureText: ctrl.obscurePassword,
        style: TextStyle(
          fontSize: AppSize.width(value: 15),
          color: const Color(0xFF1E293B),
        ),
        decoration: _inputDecoration(
          'Enter Your Password',
          suffixIcon: IconButton(
            icon: Icon(
              ctrl.obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color(0xFF94A3B8),
              size: AppSize.width(value: 20),
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        validator: controller.validatePassword,
      ),
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



// Sign In Button Widget
class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.height(value: 56),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: AppSize.width(value: 16),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

// Sign Up Link Widget
class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'New to Theory Test? ',
          style: TextStyle(
            fontSize: AppSize.width(value: 14),
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.signUpScreen);
          },
          child: Text(
            'Create Account',
            style: TextStyle(
              fontSize: AppSize.width(value: 14),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2563EB),
            ),
          ),
        ),
      ],
    );
  }
}