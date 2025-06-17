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

class RecoverResetPasswordScreen extends StatefulWidget {
  const RecoverResetPasswordScreen({super.key});

  static String name = 'recover-reset-password-screen';

  @override
  State<RecoverResetPasswordScreen> createState() => _RecoverResetPasswordScreenState();
}

class _RecoverResetPasswordScreenState extends State<RecoverResetPasswordScreen> {

  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;



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
              Center(child: const TitleTextWidget(title: 'Reset Password')),
              const SizedBox(height: 8),
              const TextDescriptionWidget(
                description: 'Your password must be at least 8 characters long and include a combination of letters, numbers.',
              ),
              const SizedBox(height: 32),

              _buildForm(),

              const SizedBox(height: 16),

              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                   //code hare
                    
                  }
                },
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
          const Text('New Password'),
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
          const SizedBox(height: 16),

          const Text('Confirm New Password'),
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
