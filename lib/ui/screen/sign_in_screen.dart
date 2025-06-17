import 'package:bd_calling_task/assets_path.dart';
import 'package:bd_calling_task/ui/screen/sign_up_screen.dart';
import 'package:bd_calling_task/ui/widget/CustomButton.dart';
import 'package:bd_calling_task/ui/widget/rich_auth_navigation_text.dart';
import 'package:bd_calling_task/ui/widget/text_description_widget.dart';
import 'package:bd_calling_task/ui/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'forgor_pass_email_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String name = 'sign-in/screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
              Center(child: Image.asset(AssetsImagePath.eduLogo, height: 130)),
              SizedBox(height: 12),
              Center(child: const TitleTextWidget(title: 'Welcome Back!')),
              const SizedBox(height: 8),
              const TextDescriptionWidget(
                description: 'Please login first to start your Theory Test.',
              ),
              const SizedBox(height: 32),

              _buildForm(),

              const SizedBox(height: 12),

              _buildRowRememberMe(),

              const SizedBox(height: 16),

              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                   //code hare

                  }
                },
              ),

              const SizedBox(height: 16),

              Center(
                child: RichAuthNavigationText(
                  leadingText: 'New to Theory Test? ',
                  actionText: 'Create Account',
                  onTap: () {
                    Get.toNamed(SignUpScreen.name);
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



  Widget _buildRowRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (val) {
                setState(() {
                  _rememberMe = val!;
                });
              },
            ),
            const Text('Remember Me'),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(ForgotPassEmailScreen.name);
          },
          child: const Text('Forgot Password'),
        ),
      ],
    );
  }

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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
            validator: (String? value) {
              if (value
                  ?.trim()
                  .isEmpty ?? true) {
                return 'Enter a valid email address';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const Text('Password'),
          const SizedBox(height: 8),

          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your password';
              }
              return null;
            },            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

//============================================================
//--------------------------Method End-----------------------------------
//=============================================================

}
