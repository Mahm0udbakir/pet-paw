import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';

class NoReceiveOtp extends StatelessWidget {
  const NoReceiveOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      AppStrings.didNotReceiveOtp,
      style: TextStyle(
        color: AppColors.iconColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}
