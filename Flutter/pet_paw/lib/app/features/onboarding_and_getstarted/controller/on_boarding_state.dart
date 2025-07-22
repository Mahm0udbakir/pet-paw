part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}
final class ChangeOnBoardingPageState extends OnBoardingState {}
final class AddPageNumberInit extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {
  final int currentIndex;

  OnBoardingPageChanged(this.currentIndex);
}

