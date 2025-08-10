import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_cubit.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_state.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/signup_body.dart';
import 'package:petpaw/app/core/utils/helpers/loaders.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

import '../../../../core/utils/constants/app_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is DetailedSignupError) {
                if (state.type == SignupErrorType.termsNotAccepted) {
                  Loaders.warningSnackBar(
                    context: context,
                    title: AppStrings.termsAndConditions,
                    message: state.message,
                  );
                }
              } else if (state is SignupLoading) {
                CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: AppColors.buttonMainColor,
                );
              }
            },
            child: const SignupBody(),
          ),
        ),
      ),
    );
  }
}
