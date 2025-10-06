/*
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bd_calling_task/ui/screen/recover_reset_password_screen.dart';

import '../product_list_screen/forgot_pass_email_controller.dart';

class ForgotPassEmailWidget extends StatefulWidget {
  const ForgotPassEmailWidget({Key? key}) : super(key: key);

  @override
  _ForgotPassEmailWidgetState createState() => _ForgotPassEmailWidgetState();
}

class _ForgotPassEmailWidgetState extends State<ForgotPassEmailWidget> {
  final ForgotPassEmailController product_list_screen = Get.put(ForgotPassEmailController());
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2E6BFF); // স্ক্রিনশটের ব্লু টোন

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
              double sw(num v) => v * scale;
              double fs(num v) => v * scale;

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
                        style: TextStyle(fontSize: fs(20), fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: sw(6)),
                    Center(
                      child: Text(
                        'Enter your email, we will send a\nverification code to email.',
                        style: TextStyle(fontSize: fs(12), color: const Color(0xFF8C8C8C), height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: sw(28)),
                    _buildForm(product_list_screen, sw, fs),
                    SizedBox(height: sw(24)),
                    _buildContinueButton(product_list_screen, sw, fs),
                    SizedBox(height: sw(16)),
                    _buildSignInText(product_list_screen, sw, fs),
                    SizedBox(height: max(sw(12), 8).toDouble()), // Ensured toDouble() conversion
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildForm(ForgotPassEmailController product_list_screen, double sw, double fs) {
    return Form(
      key: product_list_screen.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: TextStyle(fontSize: fs(12), color: Colors.black87, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: sw(8)),
          Obx(() {
            return TextFormField(
              product_list_screen: _emailController,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(fontSize: fs(14)),
              onChanged: (value) => product_list_screen.updateEmail(value),
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: TextStyle(fontSize: fs(14), color: const Color(0xFFB6B6B6)),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: sw(18), vertical: sw(14)),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sw(28)),
                  borderSide: const BorderSide(color: Color(0xFFE6E6E6), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sw(28)),
                  borderSide: const BorderSide(color: primaryBlue, width: 1.4),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sw(28)),
                  borderSide: const BorderSide(color: Colors.redAccent, width: 1),
                ),
              ),
              validator: product_list_screen.validateEmail,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildContinueButton(ForgotPassEmailController product_list_screen, double sw, double fs) {
    return SizedBox(
      width: double.infinity,
      height: sw(56),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E6BFF),
          shape: StadiumBorder(),
          elevation: 0,
        ),
        onPressed: () {
          if (product_list_screen.isValidForm()) {
            Get.toNamed(RecoverResetPasswordScreen.name);
          }
        },
        child: Text(
          'Continue',
          style: TextStyle(fontSize: fs(16), fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignInText(ForgotPassEmailController product_list_screen, double sw, double fs) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: TextStyle(fontSize: fs(14), color: const Color(0xFF707070)),
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: fs(14), fontWeight: FontWeight.w600, color: const Color(0xFF2E6BFF)),
            ),
          ),
        ],
      ),
    );
  }
}
*/
