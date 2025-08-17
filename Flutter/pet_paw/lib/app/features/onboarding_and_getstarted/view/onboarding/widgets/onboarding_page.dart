import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../model/onboarding_model.dart';
import 'page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          onboardingModel.image,
          width: 0.8.sw,
          height: 1.02.sw,
          fit: BoxFit.contain,
        ),

        SizedBox(height: Sizes.defaultSpace.h),

        const PageIndicator(),

        SizedBox(height: Sizes.spaceBetweenSections + 2.h),

        Text(
          onboardingModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: AppColors.mainColor,
            fontFamily: 'Nunito',
          ),
        ),

        SizedBox(height: Sizes.spaceBetweenSections.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            onboardingModel.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.smallTextColor,
              fontFamily: 'Nunito',
            ),
          ),
        ),
      ],
    );
  }
}
