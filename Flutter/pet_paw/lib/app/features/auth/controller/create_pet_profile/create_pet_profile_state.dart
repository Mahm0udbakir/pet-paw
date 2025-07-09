part of 'create_pet_profile_cubit.dart';

@immutable
sealed class CreatePetProfileState {}

final class CreatePetProfileInitial extends CreatePetProfileState {}

class WeightUpdated extends CreatePetProfileState {}

class ImagePicking extends CreatePetProfileState {}

class ImagePicked extends CreatePetProfileState {
  final String path;
  ImagePicked(this.path);
}

class ImagePickFailed extends CreatePetProfileState {
  final String error;
  ImagePickFailed(this.error);
}

class ImagePickCancelled extends CreatePetProfileState {}

class ImageUploading extends CreatePetProfileState {}

class ImageUploadedSuccessfully extends CreatePetProfileState {
  final String imagePath;
  ImageUploadedSuccessfully(this.imagePath);
}

class ImageUploadFailed extends CreatePetProfileState {
  final String error;
  ImageUploadFailed(this.error);
}

class BirthdaySelected extends CreatePetProfileState {
  final DateTime date;
  BirthdaySelected(this.date);
}

class ColorSelected extends CreatePetProfileState {
  final String? color;
  ColorSelected(this.color);
}

class PetTypeSelected extends CreatePetProfileState {
  final String? petType;
  PetTypeSelected(this.petType);
}

class BreedCleared extends CreatePetProfileState {}

class BreedSelected extends CreatePetProfileState {
  final String? breed;
  BreedSelected(this.breed);
}

class GenderSelected extends CreatePetProfileState {
  final String? gender;
  GenderSelected(this.gender);
}

class NeuterStatusSelected extends CreatePetProfileState {
  final String? neuterStatus;
  NeuterStatusSelected(this.neuterStatus);
}

class ValidationFailed extends CreatePetProfileState {
  final String message;
  ValidationFailed(this.message);
}

class CreatingPetProfile extends CreatePetProfileState {}

class ProfileCreatedSuccessfully extends CreatePetProfileState {
  // final Map<String, dynamic> data;
  // ProfileCreatedSuccessfully(this.data);
}

class ProfileCreationFailed extends CreatePetProfileState {
  final String error;
  ProfileCreationFailed(this.error);
}

class CreatePetProfileLoading extends CreatePetProfileState {}
