import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/signup_form.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/login/login_cubit.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.defaultSpace,
        horizontal: Sizes.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create new account',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.buttonMainColor,
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenSections),
            SignupForm(),
            const SizedBox(height: Sizes.spaceBetweenItems * 2),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.buttonMainColor,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => LoginCubit(),
                              child: const LoginScreen(),
                            ),
                          ),
                          (route) => false,
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
