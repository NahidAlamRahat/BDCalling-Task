import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassEmailController extends GetxController {
  // Observable variable
  var email = ''.obs;

  // TextEditingController to manage the email input field
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Dispose method to clean up controllers
  @override
  void onClose() {
    emailController.dispose(); // Dispose of the product_list_screen to avoid memory leaks
    super.onClose();
  }

  // Validate Email Method
  String? validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Enter a valid email address';
    final emailRe = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRe.hasMatch(v)) return 'Enter a valid email address';
    return null;
  }

  // Check form validity
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Update Email value
  void updateEmail(String value) {
    email.value = value;
  }
}
