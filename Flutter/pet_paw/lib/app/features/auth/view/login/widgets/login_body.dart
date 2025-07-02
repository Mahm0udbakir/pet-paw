import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

import '../../../../../core/utils/helpers/loaders.dart';
import '../../../controller/signup/signup_cubit.dart';
import '../../signup/signup_screen.dart';
import 'social_buttons.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/login/login_cubit.dart';
import '../../../controller/login/login_state.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
            LoginHeader(),
            const SizedBox(height: Sizes.spaceBetweenSections),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Loaders.successSnackBar(
                    context: context,
                    title: 'Login Successful',
                    message: 'Welcome back',
                  );
                } else if (state is LoginError) {
                  Loaders.errorSnackBar(
                    context: context,
                    title: 'Login Failed',
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                return const LoginForm();
              },
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            Text(
              'Or Sign in with',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.buttonMainColor,
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            SocialButtons(),
            const SizedBox(height: Sizes.spaceBetweenItems),
            Text.rich(
              TextSpan(
                text: 'No account yet? ',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'Create one',
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
                            builder: (context) => const SignupScreen(),
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
