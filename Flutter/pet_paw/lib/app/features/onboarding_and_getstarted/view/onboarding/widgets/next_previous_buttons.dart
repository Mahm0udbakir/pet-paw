import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/controller/on_boarding_cubit.dart';

class NextPreviousButtons extends StatelessWidget {
  const NextPreviousButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          final cubit = context.read<OnBoardingCubit>();
          int currentPage = 0;
          if (state is OnBoardingPageChanged) {
            currentPage = state.currentIndex;
          }
          final isFirstPage = currentPage == 0;
          final isLastPage = currentPage == cubit.onboardingList.length - 1;

          if (isLastPage) {
            return CustomDarkButton(
              text: 'Get Started',
              onPressed: cubit.skipPage,
            );
          } else if (isFirstPage) {
            return Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 150,
                child: CustomDarkButton(
                  text: 'Next',
                  onPressed: () => cubit.nextPage(context),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 48.h,
              child: Row(
                children: [
                  Expanded(
                    child: CustomDarkButton(
                      text: 'Previous',
                      onPressed: () {
                        cubit.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        cubit.updatePageIndicator(currentPage - 1);
                      },
                    ),
                  ),
                  const SizedBox(width: Sizes.spaceBetweenSections),
                  Expanded(
                    child: CustomDarkButton(
                      text: 'Next',
                      onPressed: () => cubit.nextPage(context),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
