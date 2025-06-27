import '../../model/user_model.dart';

enum SignupErrorType {
  termsNotAccepted,
  passwordMismatch,
  validation,
  server,
  unknown,
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserModel user;
  SignupSuccess(this.user);
}

class SignupError extends SignupState {
  final String message;
  SignupError(this.message);
}

class PasswordVisibilityToggled extends SignupState {}

class TermsToggled extends SignupState {}

class PasswordValidated extends SignupState {}

class DetailedSignupError extends SignupError {
  final SignupErrorType type;

  DetailedSignupError(super.message, {this.type = SignupErrorType.unknown});
}
