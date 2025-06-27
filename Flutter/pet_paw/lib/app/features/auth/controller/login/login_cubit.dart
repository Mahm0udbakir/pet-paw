import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../../core/config/api_config.dart';
import '../../../../core/config/token_storage.dart';
import '../../model/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    emit(LoginLoading());

    final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.login}');
    final body = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
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
        emit(LoginError('No response from server.'));
        return;
      }

      final responseData = jsonDecode(response.body);
      final statusCode = response.statusCode;

      if (statusCode == 200 && responseData['success'] == true) {
        final user = UserModel.fromJson(responseData['data']);
        await TokenStorage.saveToken(user.token);
        emit(LoginSuccess(user));
      } else {
        final errorMessage = responseData['message'] ?? 'Login failed';
        emit(LoginError(errorMessage));
      }
    } catch (e) {
      emit(LoginError('Something went wrong: ${e.toString()}'));
    }
  }
}
