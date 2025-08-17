import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import 'language_and_theme.dart';

class TopGetStarted extends StatelessWidget {
  const TopGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Column(
            children: [
              Text(
                AppStrings.getStartedTitle,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Sizes.sm.h),
              Text(
                AppStrings.getStartedSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? Color(0xffBDBDBD) : Color(0xff30200D),
                  fontSize: HelperFunctions.isArabic(context) ? 16.sp : 15.sp,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: Sizes.xl + 4.h),
        SvgPicture.asset(ImagesStrings.getStarted),
        SizedBox(height: Sizes.lg.h),
        LanguageAndTheme(),
      ],
    );
  }
}
