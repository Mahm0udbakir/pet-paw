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
        Text(
          AppStrings.getStartedTitle,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.buttonMainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Sizes.lg.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            AppStrings.getStartedSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: isDark ? Color(0xffBDBDBD) : AppColors.grey,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: Sizes.spaceBetweenSections.h),
        SvgPicture.asset(ImagesStrings.getStarted),
        SizedBox(height: Sizes.lg.h),
        LanguageAndTheme(),
      ],
    );
  }
}
