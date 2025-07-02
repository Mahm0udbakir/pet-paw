import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../../core/config/api_config.dart';
import '../../../../core/config/token_storage.dart';
import '../../../../core/utils/validators/password_validator.dart';
import '../../model/user_model.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  bool triedToSubmit = false;
  bool terms = true;
  bool isPasswordObscured = true;
  String currentPassword = '';

  // Password validation accessors
  bool get hasMinLength => PasswordValidator.hasMinLength(currentPassword);
  bool get hasNumber => PasswordValidator.hasNumber(currentPassword);
  bool get hasUpper => PasswordValidator.hasUpper(currentPassword);
  bool get hasLower => PasswordValidator.hasLower(currentPassword);
  bool get hasSpecial => PasswordValidator.hasSpecial(currentPassword);
  bool get isPasswordValid => PasswordValidator.isValid(currentPassword);
  int get passwordStrengthCount =>
      PasswordValidator.countValidations(currentPassword);

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void toggleTerms() {
    terms = !terms;
    emit(TermsToggled());
  }

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(PasswordVisibilityToggled());
  }

  // void validatePassword(String password) {
  //   final oldState = isPasswordValid;
  //   currentPassword = password;
  //   if (isPasswordValid != oldState) {
  //     emit(PasswordVisibilityToggled());
  //   }
  // }
  void validatePassword(String password) {
    currentPassword = password;
    emit(PasswordValidationChanged());
  }


  bool isFormValid() => signupFormKey.currentState?.validate() ?? false;

  bool isPasswordConfirmed(String password, String confirmPassword) =>
      password == confirmPassword;

  bool isTermsAccepted() => terms;

  Future<void> signup() async {
    triedToSubmit = true;

    if (!isFormValid()) return;

    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (!isPasswordConfirmed(password, confirmPassword)) {
      emit(SignupError('Passwords do not match.'));
      return;
    }

    if (!isPasswordValid) {
      emit(SignupError('Password does not meet the strength requirements.'));
      return;
    }

    if (!isTermsAccepted()) {
      emit(
        DetailedSignupError(
          'Please accept the terms and conditions.',
          type: SignupErrorType.termsNotAccepted,
        ),
      );
      return;
    }

    emit(SignupLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.signup}');
    final body = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      'confirmPassword': confirmPasswordController.text.trim(),
      'phone': phoneController.text.trim(),
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
        emit(SignupError('No response from server.'));
        return;
      }

      final responseData = jsonDecode(response.body);
      final statusCode = response.statusCode;

      print('[SignupCubit] Raw response: ${response.body}');
      print('[SignupCubit] Status code: ${response.statusCode}');

      if (statusCode == 200 && responseData['success'] == true) {
        if (responseData.containsKey('data')) {
          final user = UserModel.fromJson(responseData['data']);
          await TokenStorage.saveToken(user.token);
          emit(SignupSuccess(user));
        } else {
          emit(SignupError('Unexpected response structure.'));
        }
      } else if (statusCode == 400 || statusCode == 422) {
        emit(SignupError(responseData['message'] ?? 'Validation failed.'));
      } else {
        emit(SignupError(responseData['message'] ?? 'Signup failed.'));
      }
    } catch (e) {
      emit(
        SignupError(
          'Something went wrong. Please check your internet connection.',
        ),
      );
    }
  }
}
