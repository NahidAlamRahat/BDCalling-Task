import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bd_calling_task/ui/screen/product_list_screen.dart';

class SignInController extends GetxController {
  // Text Editing Controllers
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // State Variables
  bool obscurePassword = true;
  bool rememberMe = false;

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update(); // Update UI
  }

  // Toggle Remember Me
  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe = value;
      update(); // Update UI
    }
  }

  // Sign In Method (Firebase)
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        // Firebase Login
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTEController.text.trim(),
          password: passwordTEController.text.trim(),
        );

        // Success -> Navigate
        Get.offAllNamed(AppRoutes.productListScreen);

      } on FirebaseAuthException catch (e) {
        String message = "Login failed";

        if (e.code == 'user-not-found') {
          message = "No account found with this email. Please sign up first.";
        } else if (e.code == 'wrong-password') {
          message = "Incorrect password. Try again.";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email address.";
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

  // Validate Email
  String? validateEmail(String? value) {
    bool emailValid =
    RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value ?? "");
    if (value == null || value.isEmpty) {
      return "Enter Email";
    } else if (!emailValid) {
      return "Enter a valid Email";
    }
    return null;
  }

  // Validate Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Password";
    } else if (value.length < 8) {
      return "Password length should be more than 8 characters";
    }
    return null;
  }

 /* @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }*/
}
