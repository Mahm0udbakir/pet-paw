import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/controller/on_boarding_cubit.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/onboarding/widgets/next_previous_buttons.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/onboarding/widgets/onboarding_page.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/onboarding/widgets/skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnBoardingCubit>();
    final onboardingList = onboardingCubit.onboardingList;
    

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            Align(alignment: Alignment.centerRight, child: SkipButton()),

            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    OnboardingPage(onboardingModel: onboardingList[index]),
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  context.read<OnBoardingCubit>().updatePageIndicator(index);
                },
                controller: onboardingCubit.pageController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: NextPreviousButtons(),
        ),
      ),
    );
  }
}
