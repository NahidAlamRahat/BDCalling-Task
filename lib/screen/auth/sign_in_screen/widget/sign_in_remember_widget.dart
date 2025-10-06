// Remember Me & Forgot Password Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../widget/app_size.dart';
import '../controller/sign_in_screen_controller.dart';

class RememberMeRow extends StatelessWidget {
  final SignInController controller;

  const RememberMeRow({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetBuilder<SignInController>(
              builder: (ctrl) => Transform.scale(
                scale: 1.05,
                child: Checkbox(
                  value: ctrl.rememberMe,
                  onChanged: controller.toggleRememberMe,
                  activeColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(
                    color: Color(0xFFCBD5E1),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSize.width(value: 4)),
            Text(
              'Remember Me',
              style: TextStyle(
                fontSize: AppSize.width(value: 14),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(AppRoutes.forgotPassEmailScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(value: 8),
              vertical: AppSize.height(value: 4),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: AppSize.width(value: 14),
              fontWeight: FontWeight.w400,
              color: const Color(0xFF64748B),
            ),
          ),
        ),
      ],
    );
  }
}