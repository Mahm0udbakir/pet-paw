abstract class ResetPasswordState {}

/// Forgot Password States
class ForgotPasswordInitial extends ResetPasswordState {}

class ForgotPasswordLoading extends ResetPasswordState {}

class ForgotPasswordSuccess extends ResetPasswordState {
  final String message;
  ForgotPasswordSuccess(this.message);
}

class ForgotPasswordError extends ResetPasswordState {
  final String message;
  ForgotPasswordError(this.message);
}

/// OTP Verification States
class OtpVerificationLoading extends ResetPasswordState {}

class OtpVerificationSuccess extends ResetPasswordState {
  final String message;
  OtpVerificationSuccess(this.message);
}

class OtpVerificationError extends ResetPasswordState {
  final String message;
  OtpVerificationError(this.message);
}

/// Reset Password States
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