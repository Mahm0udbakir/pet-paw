import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../controller/on_boarding_cubit.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Align(
      alignment: isRtl ? Alignment.centerLeft : Alignment.centerRight,
      child: InkWell(
        onTap: () {
          final lastPageIndex =
              context.read<OnBoardingCubit>().onboardingList.length - 1;

          context.read<OnBoardingCubit>().pageController.jumpToPage(
            lastPageIndex,
          );

          context.read<OnBoardingCubit>().updatePageIndicator(lastPageIndex);
        },
        child: SizedBox(
          width: 80.w,
          height: 40.h,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Text(
                  AppStrings.skipButton,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.iconColor.withValues(alpha: 0.5),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 8.w),
                // Icon(
                //   isRtl
                //       ? Icons.skip_previous_outlined
                //       : Icons.skip_next_outlined,
                //   color: AppColors.iconColor.withValues(alpha: 0.5),
                //   size: 24.sp,
                // ),
                SvgPicture.asset(ImagesStrings.skipIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
