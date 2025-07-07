import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';

class NoReceiveOtp extends StatelessWidget {
  const NoReceiveOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Didn’t receive the OTP?',
    style: TextStyle(
      color: AppColors.iconColor,
      fontWeight: FontWeight.w400,
      fontSize: 16
    ),);
  }
}
