import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.iconColor.withValues(alpha: 0.1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImagesStrings.google),
                width: Sizes.mdIcon,
                height: Sizes.mdIcon,
              ),
              const SizedBox(width: Sizes.sm),
              Text(
                AppStrings.google,
                style: TextStyle(
                  color: AppColors.iconColor.withValues(alpha: 0.9),
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Sizes.spaceBetweenItems.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.iconColor.withValues(alpha: 0.1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImagesStrings.facebook),
                width: Sizes.mdIcon,
                height: Sizes.mdIcon,
              ),
              const SizedBox(width: Sizes.sm),
              Text(
                AppStrings.facebook,
                style: TextStyle(
                  color: AppColors.iconColor.withValues(alpha: 0.9),
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   width: 56,
        //   height: 56,
        //   decoration: BoxDecoration(
        //     color: isDark ? AppColors.grey : AppColors.white,
        //     borderRadius: BorderRadius.circular(100),
        //     boxShadow: [
        //       BoxShadow(
        //         color: isDark
        //             ? AppColors.white.withOpacity(0.35)
        //             : AppColors.black.withOpacity(0.35),
        //         blurRadius: 15,
        //         spreadRadius: 1,
        //       ),
        //     ],
        //   ),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: Image(
        //       image: AssetImage(ImagesStrings.facebook),
        //       width: Sizes.mdIcon,
        //       height: Sizes.mdIcon,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
