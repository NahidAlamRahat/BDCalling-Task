import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_up_controller.dart';

// Welcome Header Widget
class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        const Text(
          'Welcome to Eduline',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
        SizedBox(height: screenHeight * 0.012),
        Text(
          "Let's join to Eduline learning ecosystem & meet our professional mentor. It's Free!",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// Sign Up Form Widget
class SignUpForm extends StatelessWidget {
  final SignUpController controller;

  const SignUpForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildNameField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 12),
          GetBuilder<SignUpController>(
            builder: (ctrl) => PasswordStrengthIndicator(
              strengthLevel: ctrl.strengthLevel,
              passwordStrength: ctrl.passwordStrength,
            ),
          ),
          const SizedBox(height: 8),
          GetBuilder<SignUpController>(
            builder: (ctrl) => PasswordRequirements(
              strengthLevel: ctrl.strengthLevel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email Address",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          decoration: _inputDecoration('Enter Your Email'),
          validator: controller.validateEmail,
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Full Name",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.nameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: _inputDecoration("Pristia Candra"),
          validator: controller.validateName,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        GetBuilder<SignUpController>(
          builder: (ctrl) => TextFormField(
            controller: controller.passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: ctrl.obscurePassword,
            decoration: _passwordInputDecoration(ctrl.obscurePassword, controller.togglePasswordVisibility),
            validator: controller.validatePasswordField,
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100), // sob somoy 100
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
    );

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 14,
      ),
      filled: true,
      fillColor: Colors.grey[50],
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: Color(0xFF0066FF), width: 1.5),
      ),
      errorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  InputDecoration _passwordInputDecoration(bool obscurePassword, VoidCallback toggleVisibility) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100), // sob somoy 100
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
    );

    return InputDecoration(
      hintText: '••••••••',
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 20,
        letterSpacing: 2,
      ),
      filled: true,
      fillColor: Colors.grey[50],
      suffixIcon: IconButton(
        icon: Icon(
          obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.grey[600],
          size: 22,
        ),
        onPressed: toggleVisibility,
      ),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: Color(0xFF0066FF), width: 1.5),
      ),
      errorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}

// Password Strength Indicator Widget
class PasswordStrengthIndicator extends StatelessWidget {
  final int strengthLevel;
  final String passwordStrength;

  const PasswordStrengthIndicator({
    super.key,
    required this.strengthLevel,
    required this.passwordStrength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: strengthLevel >= 1
                  ? (strengthLevel == 1 ? Colors.red : const Color(0xFF0066FF))
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: strengthLevel >= 2 ? const Color(0xFF0066FF) : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: strengthLevel >= 3 ? const Color(0xFF0066FF) : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          passwordStrength,
          style: TextStyle(
            fontSize: 12,
            color: strengthLevel == 0
                ? Colors.grey[600]
                : (strengthLevel == 1 ? Colors.red : const Color(0xFF0066FF)),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// Password Requirements Widget
class PasswordRequirements extends StatelessWidget {
  final int strengthLevel;

  const PasswordRequirements({
    super.key,
    required this.strengthLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          strengthLevel >= 2 ? Icons.check_circle : Icons.check_circle_outline,
          size: 18,
          color: strengthLevel >= 2 ? Colors.green : Colors.grey[400],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'At least 8 characters with a combination of letters and numbers',
            style: TextStyle(
              fontSize: 12,
              color: strengthLevel >= 2 ? Colors.green : Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}

// Sign Up Button Widget
class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0066FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Label',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Sign In Link Widget
class SignInLink extends StatelessWidget {
  const SignInLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0066FF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
