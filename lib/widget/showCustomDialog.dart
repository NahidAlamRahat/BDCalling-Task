import 'dart:ui';
import 'package:bd_calling_task/widget/text_description_widget.dart';
import 'package:bd_calling_task/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'CustomButton.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String description,
  required String buttonText,
  required String animationPath,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie animation
                Lottie.asset(animationPath),
                const SizedBox(height: 10),
          
                TitleTextWidget(title: title),
                const SizedBox(height: 8),
                TextDescriptionWidget(description: description),
                const SizedBox(height: 20),
          
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}