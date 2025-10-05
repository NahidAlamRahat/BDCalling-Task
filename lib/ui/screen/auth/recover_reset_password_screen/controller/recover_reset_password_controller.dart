import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RecoverResetPasswordController extends GetxController {
  // Text controllers for password and confirm password fields
  var passwordTEController = TextEditingController();
  var confirmPasswordTEController = TextEditingController();

  // Observable boolean for password visibility
  var obscurePassword = true.obs;

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password validation logic
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Clean up text controllers when no longer needed
  @override
  void onClose() {
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    super.onClose();
  }
}
