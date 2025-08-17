import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http_parser/http_parser.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/config/token_storage.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/helpers/loaders.dart';
import '../../model/pet_profile_model.dart';

part 'create_pet_profile_state.dart';

class CreatePetProfileCubit extends Cubit<CreatePetProfileState> {
  CreatePetProfileCubit() : super(CreatePetProfileInitial()) {
    birthdayController.addListener(autoFormatBirthdayDate);
  }

  // Variables
  // final formKey = GlobalKey<FormState>();
  final step1FormKey = GlobalKey<FormState>();
  final step2FormKey = GlobalKey<FormState>();
  final step3FormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final colorController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final petTypeController = TextEditingController();
  final breedController = TextEditingController();
  final medicalController = TextEditingController();

  final nameFocus = FocusNode();
  final birthdayFocus = FocusNode();
  final colorFocus = FocusNode();
  final weightFocus = FocusNode();
  final petTypeFocus = FocusNode();
  final breedFocus = FocusNode();
  final medicalFocus = FocusNode();

  String previousBirthdayText = '';
  String? selected;
  String? selectedColor;
  String? selectedType;
  String? selectedBreed;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  String? gender;
  String? neuterStatus;
  bool hasMedicalCondition = false;

  double weight = 0.0;
  double minWeight = 0.0;
  double maxWeight = 200.0;
  double height = 0.0;
  double minHeight = 0.0;
  double maxHeight = 200.0;

  // Lists
  List<String> colorOptions = [
    AppStrings.black,
    AppStrings.brown,
    AppStrings.white,
    AppStrings.gray,
    AppStrings.golden,
  ];
  List<String> petTypeOptions = ['Dog', 'Cat'];
  List<String> breedOptions = [];
  Map<String, String> petTypeDisplayMap = {
    'Dog': AppStrings.dog,
    'Cat': AppStrings.cat,
  };

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

  void decrementHeight() {
    if (height > minHeight) height -= 0.1;
    height = double.parse(height.toStringAsFixed(1));
    heightController.text = height.toString();
    emit(HeightUpdated());
  }

  void incrementHeight() {
    if (height < maxHeight) height += 0.1;
    height = double.parse(height.toStringAsFixed(1));
    heightController.text = height.toString();
    emit(HeightUpdated());
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
        emit(ImagePickFailed(AppStrings.cameraPermission));
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
    final DateTime? pickedDate = await showDatePickerDialog(
      context: context,
      minDate: DateTime(2000),
      maxDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final formattedDate = dateFormat.format(pickedDate);
      birthdayController.text = formattedDate;
      emit(BirthdaySelected(pickedDate));
    }
  }

  String _convertToEnglishNumbers(String input) {
    final arabicNums = '٠١٢٣٤٥٦٧٨٩';
    final englishNums = '0123456789';

    for (int i = 0; i < arabicNums.length; i++) {
      input = input.replaceAll(arabicNums[i], englishNums[i]);
    }
    return input;
  }

  void autoFormatBirthdayDate() {
    final text = birthdayController.text;
    if (text.length > previousBirthdayText.length) {
      if (text.length == 4 && !previousBirthdayText.endsWith('-')) {
        birthdayController.text = '$text-';
        birthdayController.selection = TextSelection.collapsed(offset: 5);
      } else if (text.length == 7 && !previousBirthdayText.endsWith('-')) {
        birthdayController.text = '$text-';
        birthdayController.selection = TextSelection.collapsed(offset: 8);
      }
    }
    previousBirthdayText = birthdayController.text;
  }

  void chooseColor(String? color) {
    selectedColor = color;
    colorController.text = color ?? '';
    emit(ColorSelected(color));
  }

  void chooseType(String? type) {
    selectedType = type;
    petTypeController.text = petTypeDisplayMap[type] ?? '';

    breedOptions = type == 'Dog'
        ? dogBreeds
        : type == 'Cat'
        ? catBreeds
        : ['Select Type First'];

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
      emit(ValidationFailed(AppStrings.selectGender));
      return false;
    }
    if (neuterStatus == null) {
      emit(ValidationFailed(AppStrings.selectNeuterStatus));
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
      _showError(context, '${AppStrings.weightTooHigh} $maxWeight');
    } else if (parsed < minWeight) {
      weight = minWeight;
      weightController.text = minWeight.toString();
      emit(WeightUpdated());
      _showError(context, '${AppStrings.weightTooLow} $minWeight');
    } else {
      weight = parsed;
      emit(WeightUpdated());
    }
  }

  void validateHeightInput(BuildContext context, String value) {
    final parsed = double.tryParse(value);
    if (parsed == null) {
      heightController.text = height.toString();
      return;
    }

    if (parsed > maxHeight) {
      height = maxHeight;
      heightController.text = maxHeight.toString();
      emit(HeightUpdated());
      _showError(context, '${AppStrings.heightTooHigh} $maxHeight');
    } else if (parsed < minHeight) {
      height = minHeight;
      heightController.text = minHeight.toString();
      emit(HeightUpdated());
      _showError(context, '${AppStrings.heightTooLow} $minWeight');
    } else {
      height = parsed;
      emit(HeightUpdated());
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

    emit(FormReset());
  }

  void toggleMedicalCondition(bool value) {
    hasMedicalCondition = value;
    if (!value) medicalController.clear();
    emit(MedicalConditionVisibilityChanged(hasMedicalCondition));
  }

  Future<bool> createPetProfile(BuildContext context) async {
    if (!step3FormKey.currentState!.validate() ||
        selectedType == null ||
        selectedBreed == null ||
        selectedColor == null ||
        gender == null ||
        neuterStatus == null ||
        birthdayController.text.isEmpty ||
        weightController.text.isEmpty ||
        double.tryParse(weightController.text) == null ||
        heightController.text.isEmpty ||
        double.tryParse(heightController.text) == null) {
      emit(ValidationFailed(AppStrings.fillAllFields));
      return false;
    }

    emit(CreatingPetProfile());

    final petType = selectedType?.toLowerCase();
    final uri = Uri.parse('${ApiConfig.baseUrl}/api/Pet?petType=$petType');
    final token = await TokenStorage.getToken();

    if (token == null || token.isEmpty) {
      Loaders.errorSnackBar(
        context: context,
        title: AppStrings.authErrorTitle,
        message: AppStrings.authErrorMessage,
      );
      emit(ProfileCreationFailed(AppStrings.authTokenErrorMessage));
      return false;
    }

    try {
      final model = PetProfileModel(
        name: nameController.text,
        breed: selectedBreed!,
        birthday: _convertToEnglishNumbers(birthdayController.text.trim()),
        color: selectedColor!,
        weight: double.tryParse(weightController.text.trim())!,
        // height: double.tryParse(heightController.text.trim())!,
        gender: gender!,
        neuterStatus: neuterStatus!,
        petType: selectedType!,
        medicalConditions: medicalController.text.trim().isNotEmpty
            ? medicalController.text.trim()
            : null,
        photoPath: imageFile?.path,
      );

      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        })
        ..fields.addAll(model.toFields());

      if (model.photoPath != null) {
        request.files.add(
          await http.MultipartFile.fromPath('Photo', model.photoPath!),
        );
      } else {
        final bytes = await rootBundle.load(ImagesStrings.appIcon);
        final multipartFile = http.MultipartFile.fromBytes(
          'Photo',
          bytes.buffer.asUint8List(),
          filename: path.basename(ImagesStrings.appIcon),
          contentType: MediaType('image', 'png'),
        );
        request.files.add(multipartFile);
      }

      request.fields.forEach((k, v) => debugPrint('$k: $v'));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Raw response: $responseBody');

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ProfileCreatedSuccessfully());
        return true;
      } else {
        final decoded = jsonDecode(responseBody);
        String message = AppStrings.unknownError;

        if (decoded is Map && decoded.containsKey('errors')) {
          final errors = decoded['errors'] as Map<String, dynamic>;
          message = errors.entries
              .map((e) => "${e.key}: ${(e.value as List).join(', ')}")
              .join('\n');
        } else if (decoded['message'] != null) {
          message = decoded['message'];
        }

        emit(ProfileCreationFailed(message));
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
        context: context,
        title: AppStrings.networkErrorTitle,
        message: AppStrings.networkErrorMessage,
      );
      return false;
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    birthdayController.dispose();
    colorController.dispose();
    weightController.dispose();
    heightController.dispose();
    petTypeController.dispose();
    breedController.dispose();
    medicalController.dispose();
    return super.close();
  }

  List<String> get dogBreeds => [
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

  List<String> get catBreeds => [
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
}
