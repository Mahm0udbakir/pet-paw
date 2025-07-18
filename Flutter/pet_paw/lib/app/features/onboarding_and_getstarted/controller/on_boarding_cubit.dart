import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/get_started/get_started_screen.dart';

import '../../../core/utils/constants/images_strings.dart';
import '../model/onboarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingPageChanged(0));

  // Variables
  final pageController = PageController();

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: ImagesStrings.onBoarding1,
      title: 'Expert Care for Your Pet',
      description:
          'Keep your furry friends healthy with access to trusted veterinarians anytime, anywhere.',
    ),
    OnboardingModel(
      image: ImagesStrings.onBoarding2,
      title: 'All Essentials in One Place',
      description:
          'From toys to treats, find everything your pet needs delivered right to your door.',
    ),
    OnboardingModel(
      image: ImagesStrings.onBoarding3,
      title: 'Welcome to PetPaw!',
      description:
          'Keep your furry friends healthy with access to trusted veterinarians anytime, anywhere.',
    ),
  ];

  // Functions
  void updatePageIndicator(int index) {
    emit(OnBoardingPageChanged(index));
  }

  void nextPage(BuildContext context) {
    final currentIndex = _getCurrentIndex();
    if (currentIndex < onboardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingPageChanged(currentIndex + 1));
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => GetStartedScreen()),
        (route) => false,
      );
    }
  }

  void skipPage() {
    emit(OnBoardingPageChanged(onboardingList.length - 1));
  }

  int _getCurrentIndex() {
    final stateNow = state;
    if (stateNow is OnBoardingPageChanged) {
      return stateNow.currentIndex;
    }
    return 0;
  }
}
