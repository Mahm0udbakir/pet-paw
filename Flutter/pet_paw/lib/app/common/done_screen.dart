import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

class DoneScreen extends StatelessWidget {
  final String message;
  final String imageAsset;
  final String description;
  final String buttonText;
  final Widget nextScreen;

  const DoneScreen({
    super.key,
    required this.message,
    required this.imageAsset,
    required this.description,
    required this.buttonText,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.success,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    child: SvgPicture.asset(
                      imageAsset,
                      width: screenWidth * 0.6.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: CustomDarkButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => nextScreen),
                      (route) => false,
                    );
                  },
                  text: buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
