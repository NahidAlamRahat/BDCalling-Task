import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  // Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // State Variables
  bool obscurePassword = true;
  String passwordStrength = '';
  int strengthLevel = 0; // 0 = empty, 1 = weak, 2 = medium, 3 = strong, 4 = very strong

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(validatePassword);
  }

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update();
  }

  // Password Validation
  void validatePassword() {
    final password = passwordController.text;

    if (password.isEmpty) {
      strengthLevel = 0;
      passwordStrength = '';
      update();
      return;
    }

    int strength = 0;

    // Check length
    if (password.length >= 8) {
      strength = 2;
      passwordStrength = 'Strong';
    } else {
      strength = 1;
      passwordStrength = 'Weak';
    }

    // Check for uppercase letters
    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);

    // Check for special characters
    bool hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    // If 8+ characters AND (uppercase OR special character) = Strong (3 bars)
    if (password.length >= 8 && (hasUppercase || hasSpecialChar)) {
      strength = 3;
      passwordStrength = 'Strong';
    }

    // If 8+ characters AND uppercase AND special character = Very Strong (all bars)
    if (password.length >= 8 && hasUppercase && hasSpecialChar) {
      strength = 4;
      passwordStrength = 'Very Strong';
    }

    strengthLevel = strength;
    update();
  }

  // Email Validator
  String? validateEmail(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Enter a valid email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Name Validator
  String? validateName(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Enter your full Name';
    }
    return null;
  }

  // Password Validator
  String? validatePasswordField(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter your password';
    }
    if (strengthLevel < 2) {
      return 'Password too weak';
    }
    return null;
  }

// Sign Up Method (Firebase Integration + Success Dialog)
  Future<void> signUp(BuildContext context, Function onSuccess) async {
    if (formKey.currentState!.validate()) {
      try {
        // Firebase signup
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Success হলে callback (dialog) call করো
        onSuccess();

      } on FirebaseAuthException catch (e) {
        String message = "Something went wrong";

        if (e.code == 'email-already-in-use') {
          message = "This email is already registered.";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email address.";
        } else if (e.code == 'weak-password') {
          message = "Password is too weak.";
        }

        Get.snackbar(
          "Error",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          titleText: const Text(
            "Error",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          messageText: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      }
    }
  }


  @override
  void onClose() {
    passwordController.removeListener(validatePassword);
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
