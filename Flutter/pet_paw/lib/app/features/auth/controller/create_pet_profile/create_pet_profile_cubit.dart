import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/config/token_storage.dart';
import '../../../../core/utils/helpers/loaders.dart';

part 'create_pet_profile_state.dart';

class CreatePetProfileCubit extends Cubit<CreatePetProfileState> {
  CreatePetProfileCubit() : super(CreatePetProfileInitial());

  // Variables
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final colorController = TextEditingController();
  final weightController = TextEditingController();
  final petTypeController = TextEditingController();
  final breedController = TextEditingController();
  final medicalController = TextEditingController();

  final petTypeDropdownController = SingleSelectController<String>(null);
  final breedDropdownController = SingleSelectController<String>(null);

  final nameFocus = FocusNode();
  final birthdayFocus = FocusNode();
  final colorFocus = FocusNode();
  final weightFocus = FocusNode();
  final petTypeFocus = FocusNode();
  final breedFocus = FocusNode();
  final medicalFocus = FocusNode();

  String? selected;
  String? selectedColor;
  String? selectedType;
  String? selectedBreed;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  String? gender;
  String? neuterStatus;

  double weight = 0.0;
  double minWeight = 0.0;
  double maxWeight = 200.0;

  // Lists
  List<String> colorOptions = ['Black', 'White', 'Brown', 'Golden', 'Gray'];
  List<String> petTypeOptions = ['Dog', 'Cat'];
  List<String> breedOptions = [];

  //----------- [Functions] Functions -----------
  void decrementWeight() {
    if (weight > minWeight) weight -= 0.1;
    weight = double.parse(weight.toStringAsFixed(1));
    weightController.text = weight.toString();
    emit(WeightUpdated());
  }

  void incrementWeight() {
    if (weight < maxWeight) weight += 0.1;
    weight = double.parse(weight.toStringAsFixed(1));
    weightController.text = weight.toString();
    emit(WeightUpdated());
  }

  Future<void> uploadImage() async {
    try {
      emit(ImageUploading());

      await Future.delayed(const Duration(seconds: 1));

      emit(ImageUploadedSuccessfully(imageFile!.path));
    } catch (_) {}
  }

  Future<void> pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        emit(ImagePickFailed('Camera permission is required.'));
        return;
      }
    }
    emit(ImagePicking());

    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (picked != null) {
        imageFile = picked;
        await uploadImage();
      }
    } catch (e) {
      emit(ImagePickFailed(e.toString()));
    }
  }

  Future<void> chooseCalendarDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthdayController.text = formattedDate;
      emit(BirthdaySelected(pickedDate));
    }
  }

  void chooseColor(String? color) {
    selectedColor = color;
    colorController.text = color ?? '';
    emit(ColorSelected(color));
  }

  void chooseType(String? type) {
    selectedType = type;
    petTypeController.text = type ?? '';
    petTypeDropdownController.value = type;

    if (type == 'Dog') {
      breedOptions = [
        'Akita',
        'American Pit Bull Terrier',
        'Australian Shepherd',
        'Beagle',
        'Bernese Mountain Dog',
        'Bichon Frise',
        'Border Collie',
        'Boxer',
        'Brittany',
        'Bulldog (English)',
        'Bull Terrier',
        'Cane Corso',
        'Cavalier King Charles Spaniel',
        'Chihuahua',
        'Collie',
        'Cocker Spaniel',
        'Dachshund',
        'Doberman Pinscher',
        'English Springer Spaniel',
        'French Bulldog',
        'German Shepherd',
        'German Shorthaired Pointer',
        'Golden Retriever',
        'Great Dane',
        'Havanese',
        'Labrador Retriever',
        'Maltese',
        'Mastiff',
        'Miniature American Shepherd',
        'Miniature Schnauzer',
        'Newfoundland',
        'Papillon',
        'Pembroke Welsh Corgi',
        'Poodle (Standard)',
        'Portuguese Water Dog',
        'Rottweiler',
        'Shiba Inu',
        'Shih Tzu',
        'Shetland Sheepdog',
        'Siberian Husky',
        'St. Bernard',
        'Vizsla',
        'Weimaraner',
        'West Highland White Terrier',
        'Yorkshire Terrier',
      ];
    } else if (type == 'Cat') {
      breedOptions = [
        'Abyssinian',
        'American Shorthair',
        'Arabian Mau',
        'Bengal',
        'British Shorthair',
        'Egyptian Mau',
        'Maine Coon',
        'Nile Valley Cat',
        'Persian',
        'Ragdoll',
        'Russian Blue',
        'Scottish Fold',
        'Siamese',
        'Siberian',
        'Sphynx',
      ];
    } else {
      breedOptions = [];
    }

    selectedBreed = null;
    breedController.clear();
    breedDropdownController.value = null;

    emit(PetTypeSelected(type));
  }

  void chooseBreed(String? breed) {
    selectedBreed = breed;
    breedController.text = breed ?? '';
    breedDropdownController.value = breed ?? '';
    emit(BreedSelected(breed));
  }

  void selectOption({required String group, required String value}) {
    switch (group) {
      case 'gender':
        gender = gender == value ? null : value;
        emit(GenderSelected(gender));
        break;
      case 'neuter':
        neuterStatus = neuterStatus == value ? null : value;
        emit(NeuterStatusSelected(neuterStatus));
        break;
    }
  }

  bool validateSelections() {
    if (gender == null) {
      emit(ValidationFailed("Please select gender."));
      return false;
    }
    if (neuterStatus == null) {
      emit(ValidationFailed("Please select neuter status."));
      return false;
    }
    return true;
  }

  void validateWeightInput(BuildContext context, String value) {
    final parsed = double.tryParse(value);
    if (parsed == null) {
      weightController.text = weight.toString();
      return;
    }

    if (parsed > maxWeight) {
      weight = maxWeight;
      weightController.text = maxWeight.toString();
      emit(WeightUpdated());
      _showError(context, 'the weight cannot be more than $maxWeight');
    } else if (parsed < minWeight) {
      weight = minWeight;
      weightController.text = minWeight.toString();
      emit(WeightUpdated());
      _showError(context, 'the weight cannot be less than $minWeight');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void clearImage() {
    imageFile = null;
    emit(ImagePickCancelled());
  }

  void resetForm() {
    nameController.clear();
    birthdayController.clear();
    colorController.clear();
    weightController.clear();
    petTypeController.clear();
    breedController.clear();
    medicalController.clear();

    selectedColor = null;
    selectedType = null;
    selectedBreed = null;
    gender = null;
    neuterStatus = null;
    weight = 0.0;
    imageFile = null;

    petTypeDropdownController.value = null;
    breedDropdownController.value = null;

    emit(FormReset());
  }

  Future<bool> createPetProfile(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Loaders.warningSnackBar(
        context: context,
        title: "Form Error",
        message: "Please fill all required fields.",
      );
      emit(ValidationFailed("Please fill all required fields."));
      return false;
    }

    if (!validateSelections()) return false;

    if (birthdayController.text.trim().isEmpty) {
      Loaders.warningSnackBar(
        context: context,
        title: "Missing Date",
        message: "Please select your pet's birth date.",
      );
      emit(ValidationFailed("Please select your pet's birth date."));
      return false;
    }

    if (selectedColor == null || selectedColor!.isEmpty) {
      Loaders.warningSnackBar(
        context: context,
        title: "Missing Color",
        message: "Please select your pet's color.",
      );
      emit(ValidationFailed("Please select your pet's color."));
      return false;
    }

    if (weightController.text.trim().isEmpty ||
        double.tryParse(weightController.text) == null) {
      Loaders.warningSnackBar(
        context: context,
        title: "Invalid Weight",
        message: "Please enter a valid weight.",
      );
      return false;
    }

    if (selectedType == null || selectedType!.isEmpty) {
      Loaders.warningSnackBar(
        context: context,
        title: "Missing Type",
        message: "Please select your pet's type.",
      );
      emit(ValidationFailed("Please select your pet's type."));
      return false;
    }

    if (selectedBreed == null || selectedBreed!.isEmpty) {
      Loaders.warningSnackBar(
        context: context,
        title: "Missing Breed",
        message: "Please select your pet's breed.",
      );
      emit(ValidationFailed("Please select your pet's breed."));
      return false;
    }

    emit(CreatingPetProfile());

    final petType = selectedType?.toLowerCase(); // مثال: dog / cat
    final uri = Uri.parse('${ApiConfig.baseUrl}/api/Pet?petType=$petType');
    final token = await TokenStorage.getToken();

    if (token == null || token.isEmpty) {
      Loaders.errorSnackBar(
        context: context,
        title: "Authentication Error",
        message: "Token is missing. Please login again.",
      );
      emit(ProfileCreationFailed("Authentication token not found."));
      return false;
    }

    try {
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        })
        ..fields['Name'] = nameController.text.trim()
        ..fields['Breed'] = selectedBreed!
        ..fields['BirthDay'] = birthdayController.text.trim()
        ..fields['Color'] = selectedColor!
        ..fields['Weight'] = (double.tryParse(
          weightController.text.trim(),
        )).toString()
        ..fields['Gender'] = gender!
        ..fields['MedicalConditions'] = medicalController.text.trim()
        ..fields['IsInBreedingPeriod'] = (neuterStatus == "Intact") == 'intact'
            ? 'false'
            : 'true'
        // ..fields['IsInBreedingPeriod'] = neuterStatus!
        ..fields['petType'] = petType!;

      if (imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath('Photo', imageFile!.path),
        );
      }

      request.fields.forEach((k, v) => print('$k: $v'));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('✅ Status code: ${response.statusCode}');
      print('✅ Raw response: $responseBody');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Loaders.successSnackBar(
          context: context,
          title: "Success",
          message: "Pet profile created successfully.",
        );
        emit(ProfileCreatedSuccessfully());
        return true;
      } else {
        final decoded = jsonDecode(responseBody);
        String message = 'Something went wrong.';

        if (decoded is Map && decoded.containsKey('errors')) {
          final errors = decoded['errors'] as Map<String, dynamic>;
          message = errors.entries
              .map((e) => "${e.key}: ${(e.value as List).join(', ')}")
              .join('\n');
        } else if (decoded['message'] != null) {
          message = decoded['message'];
        }

        Loaders.errorSnackBar(
          context: context,
          title: "Failed to Create Profile",
          message: message,
        );
        emit(ProfileCreationFailed(message));
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
        context: context,
        title: "Network Error",
        message: "Something went wrong. Please try again.",
      );
      emit(ProfileCreationFailed('Exception: $e'));
      return false;
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    birthdayController.dispose();
    colorController.dispose();
    weightController.dispose();
    petTypeController.dispose();
    breedController.dispose();
    medicalController.dispose();
    petTypeDropdownController.dispose();
    breedDropdownController.dispose();
    return super.close();
  }
}
