import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../core/config/api_config.dart';
import '../../../core/utils/validators/password_validator.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  // Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  bool triedToSubmit = false;
  bool terms = true;

  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final confirmNewPasswordFocus = FocusNode();

  bool get hasMinLength => PasswordValidator.hasMinLength(newPasswordController.text);
  bool get hasNumber => PasswordValidator.hasNumber(newPasswordController.text);
  bool get hasUpper => PasswordValidator.hasUpper(newPasswordController.text);
  bool get hasLower => PasswordValidator.hasLower(newPasswordController.text);
  bool get hasSpecial => PasswordValidator.hasSpecial(newPasswordController.text);
  bool get isPasswordValid => PasswordValidator.isValid(newPasswordController.text);
  int get passwordStrengthCount =>
      PasswordValidator.countValidations(newPasswordController.text);

  void toggleTerms() {
    terms = !terms;
    emit(TermsToggled());
  }

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(PasswordVisibilityToggled());
  }

  bool isPasswordObscured = true;

  void validatePassword(String password) {
    newPasswordController.text = password;
    emit(PasswordValidationChanged());
  }

  // bool isFormValid() => formKeyReset.currentState?.validate() ?? false;

  bool isPasswordConfirmed(String password, String confirmPassword) =>
      password == confirmPassword;

  @override
  Future<void> close() {
    emailController.dispose();
    phoneController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();

    emailFocus.dispose();
    phoneFocus.dispose();
    confirmNewPasswordFocus.dispose();

    return super.close();
  }

  /// 1) Forget Password: Send email to get OTP
  Future<void> forgetPassword() async {
    if (emailController.text.trim().isEmpty) {
      emit(ResetPasswordError('Email is required.'));
      return;
    }

    emit(ResetPasswordLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.forgetPassword}');
    final body = {'email': emailController.text.trim()};

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.body.isEmpty) {
        emit(ResetPasswordError('No response from server.'));
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? 'OTP sent to your email.';
        emit(ResetPasswordSuccess(message));
      } else {
        final error = data['message'] ?? 'Failed to send OTP.';
        emit(ResetPasswordError(error));
      }
    } catch (e) {
      emit(ResetPasswordError('Error: ${e.toString()}'));
    }
  }

  /// 2) Verify OTP
  Future<void> verifyOtp() async {
    final email = emailController.text.trim();
    final otp = otpController.text.trim();

    if (email.isEmpty || otp.isEmpty) {
      emit(ResetPasswordError('Email and OTP are required.'));
      return;
    }

    emit(ResetPasswordLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.verifyOTP}');
    final body = {'email': email, 'codeOTP': otp};

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.body.isEmpty) {
        emit(ResetPasswordError('No response from server.'));
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? 'OTP verified successfully.';
        emit(ResetPasswordSuccess(message));
      } else {
        final error = data['message'] ?? 'OTP verification failed.';
        emit(ResetPasswordError(error));
      }
    } catch (e) {
      emit(ResetPasswordError('Error: ${e.toString()}'));
    }
  }

  /// 3) Reset Password
  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    final token = otpController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmNewPasswordController.text.trim();

    if (email.isEmpty ||
        token.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      emit(ResetPasswordError('All fields are required.'));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordError('Passwords do not match.'));
      return;
    }

    emit(ResetPasswordLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.resetPassword}');
    final body = {
      'email': email,
      'token': token,
      'newPassword': newPassword,
      'confirmNewPassword': confirmPassword,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.body.isEmpty) {
        emit(ResetPasswordError('No response from server.'));
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? 'Password reset successfully.';
        emit(ResetPasswordSuccess(message));
      } else {
        final error = data['message'] ?? 'Password reset failed.';
        emit(ResetPasswordError(error));
      }
    } catch (e) {
      emit(ResetPasswordError('Error: ${e.toString()}'));
    }
  }
}
