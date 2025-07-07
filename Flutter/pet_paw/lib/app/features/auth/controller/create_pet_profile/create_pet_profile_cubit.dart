import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/config/token_storage.dart';

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

  String? selected;
  String? selectedColor;
  String? selectedType;
  String? selectedBreed;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  String? gender;
  String? neuterStatus;

  int weight = 0;
  int minWeight = 0;
  int maxWeight = 100;

  // Lists
  List<String> colorOptions = ['Black', 'White', 'Brown', 'Golden', 'Gray'];
  List<String> petTypeOptions = ['Dog', 'Cat'];
  List<String> breedOptions = [
    'Golden Retriever',
    'Persian Cat',
    'Siamese Cat',
  ];

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

  Future<void> uploadImage() async {
    if (imageFile == null) {
      emit(ImageUploadFailed('No image selected.'));
      return;
    }

    try {
      emit(ImageUploading());

      await Future.delayed(const Duration(seconds: 1));

      emit(ImageUploadedSuccessfully(imageFile!.path));
    } catch (e) {
      emit(ImageUploadFailed(e.toString()));
    }
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
        emit(ImageUploadedSuccessfully(picked.path));
        await uploadImage();
      } else {
        emit(ImagePickCancelled());
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

    if (type == 'Dog') {
      breedOptions = ['Golden Retriever', 'German Shepherd', 'Bulldog'];
    } else if (type == 'Cat') {
      breedOptions = ['Persian Cat', 'Siamese Cat', 'Maine Coon'];
    } else {
      breedOptions = [];
    }

    selectedBreed = null;
    breedController.clear();

    emit(PetTypeSelected(type));
  }

  void chooseBreed(String? breed) {
    selectedBreed = breed;
    breedController.text = breed ?? '';
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
    final parsed = int.tryParse(value);
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
    } else {
      weight = parsed;
      emit(WeightUpdated());
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

  Future<void> createPetProfile() async {
    print("🔁 Starting createPetProfile...");

    if (!formKey.currentState!.validate()) {
      print("❌ Form validation failed.");
      emit(ValidationFailed("Please fill all required fields."));
      return;
    }

    if (!validateSelections()) {
      print("❌ Gender or neuter status not selected.");
      return;
    }

    emit(CreatingPetProfile());
    print("📦 Form is valid. Creating pet profile...");

    final petType = selectedType?.toLowerCase() == 'dog' ? 1 : 0;
    final uri = Uri.parse('${ApiConfig.baseUrl}/api/Pet?petType=$petType');

    print("📍 Selected Type: $selectedType → petType = $petType");
    print("📤 Sending request to: $uri");

    final token = await TokenStorage.getToken();

    if (token == null || token.isEmpty) {
      print("❌ Token is missing. Please login again.");
      emit(ProfileCreationFailed("Authentication token not found."));
      return;
    }

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final bodyMap = {
      "name": nameController.text,
      "breed": selectedBreed,
      "birthDay": birthdayController.text,
      "color": selectedColor,
      "weight": weight,
      "gender": gender,
      "medicalCondidtions": medicalController.text,
      "isInBreedingPeriod": neuterStatus == "Yes",
      "photoUrl": imageFile?.name,
    };

    print("📄 Request Body: ${jsonEncode(bodyMap)}");

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(bodyMap),
      );

      print("✅ Response Status Code: ${response.statusCode}");
      print("🧾 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ProfileCreatedSuccessfully());
        print("🎉 Pet profile created successfully.");
      } else {
        final message = response.body.isNotEmpty
            ? jsonDecode(response.body)['message'] ?? 'Unknown error'
            : 'Unauthorized or empty response';
        emit(ProfileCreationFailed('Failed: $message'));
        print("⚠️ Failed to create profile: $message");
      }
    } catch (e) {
      emit(ProfileCreationFailed('Exception: $e'));
      print("❗ Exception during profile creation: $e");
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
    return super.close();
  }
}
