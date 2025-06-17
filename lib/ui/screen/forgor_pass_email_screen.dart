import 'package:bd_calling_task/assets_path.dart';
import 'package:bd_calling_task/ui/screen/recover_reset_password_screen.dart';
import 'package:bd_calling_task/ui/screen/sign_up_screen.dart';
import 'package:bd_calling_task/ui/widget/CustomButton.dart';
import 'package:bd_calling_task/ui/widget/rich_auth_navigation_text.dart';
import 'package:bd_calling_task/ui/widget/text_description_widget.dart';
import 'package:bd_calling_task/ui/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class ForgotPassEmailScreen extends StatefulWidget {
  const ForgotPassEmailScreen({super.key});

  static String name = 'forgot-pass-email/screen';

  @override
  State<ForgotPassEmailScreen> createState() => _ForgotPassEmailScreenState();
}

class _ForgotPassEmailScreenState extends State<ForgotPassEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(child: const TitleTextWidget(title: 'Forgot Password')),
              const SizedBox(height: 8),
              const TextDescriptionWidget(
                description:
                    'Enter your email, we will send a verification code to email.',
              ),
              const SizedBox(height: 32),

              _buildForm(),

              const SizedBox(height: 16),

              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //code hare
                    Get.toNamed(RecoverResetPasswordScreen.name);
                  }
                },
              ),

              const SizedBox(height: 16),

              Center(
                child: RichAuthNavigationText(
                  leadingText: 'Already have an account? ',
                  actionText: 'Sign In',
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //============================================================
  //-------------------------------------------------------------
  //=============================================================

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email Address'),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Email Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter a valid email address';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  //============================================================
  //--------------------------Method End-----------------------------------
  //=============================================================
}
