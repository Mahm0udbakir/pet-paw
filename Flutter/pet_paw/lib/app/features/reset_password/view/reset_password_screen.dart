import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../controller/reset_password_cubit.dart';
import 'widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: AppBar(
          title: Text("Forgot password?", style: TextStyle(
            color: AppColors.buttonMainColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),),
          centerTitle: true,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
              child: Icon(Icons.arrow_back_ios, color: AppColors.buttonMainColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(child: ResetPasswordBody()),
      ),
    );
  }
}
