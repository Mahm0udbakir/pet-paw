import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_strings.dart';
import 'widgets/otp_verification_body.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        title: Text(
          AppStrings.otpVerificationTitle,
          style: TextStyle(
            color: AppColors.buttonMainColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Icon(Icons.arrow_back_ios, color: AppColors.buttonMainColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SafeArea(child: OtpVerificationBody()),
    );
  }
}
