import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_strings.dart';

class PasswordStrengthLabel extends StatelessWidget {
  final int passedCount;

  const PasswordStrengthLabel({super.key, required this.passedCount});

  @override
  Widget build(BuildContext context) {
    String strengthText;
    Color strengthColor;

    if (passedCount <= 2) {
      strengthText = AppStrings.weakPassword;
      strengthColor = Color(0xffD10010);
    } else if (passedCount <= 4) {
      strengthText = AppStrings.normalPassword;
      strengthColor = Colors.orange;
    } else {
      strengthText = AppStrings.strongPassword;
      strengthColor = Colors.green;
    }

    return Text(
      strengthText,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: strengthColor,
        fontFamily: 'Inter',
      ),
    );
  }
}
