import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<int> {
  StepperCubit() : super(1);

  bool isForward = true;

  void changeStep(int step) => emit(step);

  void nextStep() {
    isForward = true;
    if (state < 3) {
      emit(state + 1);
    }
  }

  void previousStep() {
    isForward = false;
    if (state > 1) {
      emit(state - 1);
    }
  }
}
