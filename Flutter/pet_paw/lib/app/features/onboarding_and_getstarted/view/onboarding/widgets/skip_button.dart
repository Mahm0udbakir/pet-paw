import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

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
          // context.read<OnBoardingCubit>().skipPage();
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
                    fontWeight: FontWeight.w700,
                    color: AppColors.buttonMainColor,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  isRtl
                      ? Icons.skip_previous_outlined
                      : Icons.skip_next_outlined,
                  color: AppColors.iconColor,
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
