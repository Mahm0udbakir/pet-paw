import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(ImagesStrings.google),
              width: Sizes.mdIcon.w,
              height: Sizes.mdIcon.h,
            ),
          ),
        ),
        SizedBox(width: Sizes.spaceBetweenItems * 2.w),
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            onPressed: null,
            icon: Image(
              image: AssetImage(ImagesStrings.facebook),
              width: Sizes.mdIcon.w,
              height: Sizes.mdIcon.h,
            ),
          ),
        ),
      ],
    );
  }
}
