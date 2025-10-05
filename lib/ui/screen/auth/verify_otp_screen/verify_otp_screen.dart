import 'dart:async';
import 'package:bd_calling_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../assets_path.dart';
import '../../../widget/showCustomDialog.dart';
import '../../../widget/show_snack_bar_message.dart';
import '../../../widget/CustomButton.dart';
import '../../../widget/text_description_widget.dart';
import '../../../widget/title_text_widget.dart';
import 'package:bd_calling_task/ui/screen/product_list_screen.dart';
import 'package:bd_calling_task/ui/widget/app_size.dart';

class VerifyOtpScreenOtp extends StatefulWidget {
  const VerifyOtpScreenOtp({super.key});
  static String name = 'verify-otp-screen';

  @override
  State<VerifyOtpScreenOtp> createState() => _VerifyOtpScreenOtpState();
}

class _VerifyOtpScreenOtpState extends State<VerifyOtpScreenOtp> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late RxInt currentTime = 30.obs;

  void _startTime() {
    currentTime.value = 30;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTime.value == 0) {
        timer.cancel();
      } else {
        currentTime.value = currentTime.value - 1;
      }
    });
  }

  Widget _buildObxCountDownMethod() {
    return Obx(() {
      return Column(
        children: [
          Visibility(
            visible: currentTime.value == 0,
            child: TextButton(
              onPressed: () {
                _startTime();
                ShowSnackBarMessage(
                  'A new OTP has been sent to your Email',
                  context,
                );
              },
              child: const Text('Resend OTP'),
            ),
          ),
          Visibility(
            visible: currentTime.value != 0,
            child: TextButton(
              onPressed: () {},
              child: Text('Resend OTP in ${currentTime.value}'),
            ),
          ),
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 16)), // Making padding responsive
          child: Column(
            children: [
              SizedBox(height: AppSize.height(value: 24)),

              Center(child: TitleTextWidget(title: 'Verify Code')),
              SizedBox(height: AppSize.height(value: 8)),
              const TextDescriptionWidget(
                description: 'Please enter the code we just sent to email',
              ),
              SizedBox(height: AppSize.height(value: 16)),
              _buildPinCodeTextField(context),
              SizedBox(height: AppSize.height(value: 16)),
              CustomButton(
                text: 'Verify',
                onPressed: () {
                  _showSuccessDialog(context);
                },
              ),
              _buildObxCountDownMethod(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField(BuildContext context) {
    return Form(
      key: _formKey,
      child: PinCodeTextField(
        validator: (value) {
          if (value?.trim().isEmpty == true) {
            // Handle empty field
          }
          return null;
        },
        length: 4,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        obscureText: false,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: AppSize.height(value: 50),
          fieldWidth: AppSize.width(value: 50),
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        controller: _otpTEController,
        appContext: context,
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showCustomDialog(
      context: context,
      title: 'Successfully Registered',
      description:
      "'Your account has been registered successfully, now let\'s enjoy our features!'",
      buttonText: 'Continue',
      animationPath: AssetsAnimationPath.completeAnimation,
      onPressed: () {
        Get.offAllNamed(AppRoutes.signInScreen);
      },
    );
  }
}
