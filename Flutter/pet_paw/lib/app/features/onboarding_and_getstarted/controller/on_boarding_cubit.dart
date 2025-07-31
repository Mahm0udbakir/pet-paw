import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/get_started/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/images_strings.dart';
import '../model/onboarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingPageChanged(0));

  // Variables
  int selectedIndex = 0;
  final pageController = PageController(initialPage: 0);

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: ImagesStrings.onBoarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingSubTitle1,
    ),
    OnboardingModel(
      image: ImagesStrings.onBoarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingSubTitle2,
    ),
    OnboardingModel(
      image: ImagesStrings.onBoarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingSubTitle1,
    ),
  ];

  // Functions
  void updatePageIndicator(int index) {
    selectedIndex = index;
    emit(OnBoardingPageChanged(index));
  }

  void nextPage(BuildContext context) {
    if (selectedIndex < onboardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      removeOnBoarding(context);
    }
  }

  void initO() {
    pageController.addListener(() {
      int newPage = pageController.page!.round();
      if (selectedIndex != newPage) {
        selectedIndex = newPage;
        emit(ChangeOnBoardingPageState());
      }
    });
  }

  void removeOnBoarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const GetStartedScreen()),
    );
  }

  // int _getCurrentIndex() {
  //   final stateNow = state;
  //   if (stateNow is OnBoardingPageChanged) {
  //     return stateNow.currentIndex;
  //   }
  //   return 0;
  // }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
