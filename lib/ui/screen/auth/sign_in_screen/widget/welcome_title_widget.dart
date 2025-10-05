// Welcome Title Widget
import 'package:flutter/cupertino.dart';

import '../../../../widget/app_size.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: AppSize.width(value: 24),
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E293B),
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.height(value: 10)),
        Text(
          'Please login first to start your Theory Test.',
          style: TextStyle(
            fontSize: AppSize.width(value: 14),
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}