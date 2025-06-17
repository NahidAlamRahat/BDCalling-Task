import 'package:bd_calling_task/assets_path.dart';
import 'package:bd_calling_task/ui/screen/product_list_screen.dart';
import 'package:bd_calling_task/ui/widget/CustomButton.dart';
import 'package:bd_calling_task/ui/widget/rich_auth_navigation_text.dart';
import 'package:bd_calling_task/ui/widget/text_description_widget.dart';
import 'package:bd_calling_task/ui/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widget/showCustomDialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: const TitleTextWidget(title: 'Welcome to Eduline')),
                const SizedBox(height: 8),
                const TextDescriptionWidget(
                  description:
                      "Let's join to Eduline learning ecosystem & meet our professional mentor. It's Free!",
                ),
        
                const SizedBox(height: 32),
        
                _buildForm(),
        
                const SizedBox(height: 24),
        
                CustomButton(
                  text: 'Label',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //code hare
                      _showSuccessDialog(context);
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
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Email Address"),
          const SizedBox(height: 8),

          TextFormField(
            controller: _emailController,
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

          const SizedBox(height: 16),

          const Text("Full Name"),
          const SizedBox(height: 8),

          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Your Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your full Name';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          const Text("Password"),
          const SizedBox(height: 8),

          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your password';
              }
              return null;
            },
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }



  void _showSuccessDialog(BuildContext context) {
    showCustomDialog(context: context,
        title: 'Successfully Registered',
        description: "'Your account has been registered successfully, now let\'s enjoy our features!'",
        buttonText: 'Continue',
        animationPath: AssetsAnimationPath.completeAnimation,
        onPressed: () {Get.offAllNamed(ProductListScreen.name);});
  }


}
