import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/phone_forgot_password_body.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../controller/reset_password_cubit.dart';

class PhoneForgotPasswordScreen extends StatelessWidget {
  const PhoneForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: AppBar(
          title: const Text(
            "Forgot password?",
            style: TextStyle(
              color: AppColors.buttonMainColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.md),
              child: Icon(Icons.arrow_back_ios, color: AppColors.buttonMainColor),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const SafeArea(child: PhoneForgotPasswordBody()),
      ),
    );
  }
}
