import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_cubit.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_state.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/create_pet_profile_screen.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/signup_body.dart';
import 'package:petpaw/app/core/utils/helpers/loaders.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SafeArea(
          child: BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                Loaders.successSnackBar(
                  context: context,
                  title: 'Signup Successful',
                  message: 'Welcome',
                );
              } else if (state is SignupError) {
                Loaders.errorSnackBar(
                  context: context,
                  title: 'Signup Failed',
                  message: state.message,
                );
              } else if (state is DetailedSignupError) {
                if (state.type == SignupErrorType.termsNotAccepted) {
                  Loaders.warningSnackBar(
                    context: context,
                    title: 'Terms & Conditions',
                    message: state.message,
                  );
                } else {
                  Loaders.errorSnackBar(
                    context: context,
                    title: 'Signup Failed',
                    message: state.message,
                  );
                }
              }
            },
            child: const SignupBody(),
          ),
        ),
      ),
    );
  }
}
