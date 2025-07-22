import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../core/config/api_config.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/validators/password_validator.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ForgotPasswordInitial());

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

  bool get hasMinLength =>
      PasswordValidator.hasMinLength(newPasswordController.text);
  bool get hasNumber => PasswordValidator.hasNumber(newPasswordController.text);
  bool get hasUpper => PasswordValidator.hasUpper(newPasswordController.text);
  bool get hasLower => PasswordValidator.hasLower(newPasswordController.text);
  bool get hasSpecial =>
      PasswordValidator.hasSpecial(newPasswordController.text);
  bool get isPasswordValid =>
      PasswordValidator.isValid(newPasswordController.text);
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

  bool isPasswordConfirmed(String password, String confirmPassword) =>
      password == confirmPassword;

  String? resetToken;

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
      emit(ForgotPasswordError(AppStrings.emailRequired));
      return;
    }

    emit(ForgotPasswordLoading());

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
        emit(ForgotPasswordError(AppStrings.loginNoResponseMessage));
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? AppStrings.otpSent;
        resetToken = data['data']?.toString();
        emit(ForgotPasswordSuccess(message));
      } else {
        final error = data['message'] ?? AppStrings.otpSendFailed;
        emit(ForgotPasswordError(error));
      }
    } catch (e) {
      emit(
        ForgotPasswordError('${AppStrings.networkErrorPrefix}${e.toString()}'),
      );
    }
  }

  /// 2) Verify OTP
  Future<void> verifyOtp() async {
    final email = emailController.text.trim();
    final otp = otpController.text.trim();

    if (email.isEmpty && otp.isEmpty) {
      emit(OtpVerificationError(AppStrings.emailAndOtpRequired));
      return;
    } else if (email.isEmpty) {
      emit(OtpVerificationError(AppStrings.emailRequired));
      return;
    } else if (otp.isEmpty) {
      emit(OtpVerificationError(AppStrings.otpRequired));
      return;
    }

    emit(OtpVerificationLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.verifyOTP}');
    final body = {'email': email, 'codeOTP': otp};

    try {
      print(body);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.body.isEmpty) {
        emit(OtpVerificationError('No response from server.'));
        return;
      }
      print(response.body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? AppStrings.otpVerified;
        emit(OtpVerificationSuccess(message));
      } else {
        final error = data['message'] ?? AppStrings.otpFailed;
        emit(OtpVerificationError(error));
      }
    } catch (e) {
      emit(OtpVerificationError('Error: ${e.toString()}'));
    }
  }

  /// 3) Reset Password
  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    final token = resetToken?.trim() ?? '';
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmNewPasswordController.text.trim();

    if (email.isEmpty ||
        token.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      emit(ResetPasswordError(AppStrings.allFieldsRequired));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordError(AppStrings.passwordMismatch));
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
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final data = response.body.isNotEmpty ? jsonDecode(response.body) : {};

      if (response.statusCode == 200 && data['success'] == true) {
        final message = data['message'] ?? AppStrings.passwordResetSuccess;
        emit(ResetPasswordSuccess(message));
      } else {
        final error = data['message'] ?? AppStrings.passwordResetFailed;
        emit(ResetPasswordError(error));
      }
    } catch (e) {
      emit(
        ResetPasswordError('${AppStrings.networkErrorPrefix}${e.toString()}'),
      );
    }
  }
}
