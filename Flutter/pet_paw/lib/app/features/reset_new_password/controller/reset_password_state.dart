abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  ResetPasswordError(this.message);
}

class PasswordValidationChanged extends ResetPasswordState {}

class PasswordVisibilityToggled extends ResetPasswordState {}

class TermsToggled extends ResetPasswordState {}