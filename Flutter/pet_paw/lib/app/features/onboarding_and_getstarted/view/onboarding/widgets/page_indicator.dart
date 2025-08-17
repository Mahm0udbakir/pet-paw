import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/controller/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.watch<OnBoardingCubit>();
        return SmoothPageIndicator(
          controller: cubit.pageController,
          count: cubit.onboardingList.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,

            activeDotColor: AppColors.mainColor,
            dotColor: Color(0xffD8CEB0),
          ),
        );
      },
    );
  }
}
