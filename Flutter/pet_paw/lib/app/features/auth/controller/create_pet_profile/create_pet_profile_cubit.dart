import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'create_pet_profile_state.dart';

class CreatePetProfileCubit extends Cubit<CreatePetProfileState> {
  CreatePetProfileCubit() : super(CreatePetProfileInitial());

  // Variables
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final colorController = TextEditingController();
  final weightController = TextEditingController();

  String? selected;

  int weight = 0;
  int minWeight = 0;
  int maxWeight = 100;

  void decrementWeight() {
    if (weight > minWeight) weight--;
    weightController.text = weight.toString();
    emit(WeightUpdated());
  }

  void incrementWeight() {
    if (weight < maxWeight) weight++;
    weightController.text = weight.toString();
    emit(WeightUpdated());
  }

  Future<void> uploadImage() async {}

  void selectImage() {}

  Future<void> chooseCalendarDate() async {}

  Future<void> chooseColor() async {}

  Future<void> chooseWeight() async {}

  void radioSelected(String value) {
    // final bool isSelected = selected == value;
    selected = value;
    emit(CreatePetProfileInitial());
  }

  Future<void> createPetProfile() async {}
}
