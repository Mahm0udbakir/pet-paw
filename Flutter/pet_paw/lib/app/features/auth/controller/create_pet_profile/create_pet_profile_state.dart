part of 'create_pet_profile_cubit.dart';

@immutable
sealed class CreatePetProfileState {}

final class CreatePetProfileInitial extends CreatePetProfileState {}

final class CreatePetProfileError extends CreatePetProfileState {
  final String message;
  CreatePetProfileError(this.message);
}

class WeightUpdated extends CreatePetProfileState {}

final class CreatePetProfileSuccess extends CreatePetProfileState {}

final class CreatePetProfileImageUploadError extends CreatePetProfileState {
  final String message;
  CreatePetProfileImageUploadError(this.message);
}

final class CreatePetProfileImageUploadSuccess extends CreatePetProfileState {}
