import 'package:flutter/material.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/features/auth/view/login/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(child: LoginBody()),
    );
  }
}
