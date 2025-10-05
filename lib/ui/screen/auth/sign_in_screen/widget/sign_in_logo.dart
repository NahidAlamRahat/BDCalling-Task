// Logo Widget
import 'package:flutter/cupertino.dart';

import '../../../../widget/app_size.dart';

class SignInLogo extends StatelessWidget {
  final String logoPath;

  const SignInLogo({
    super.key,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoPath,
      height: AppSize.height(value: 106),
      width: AppSize.width(value: 106),
    );
  }
}