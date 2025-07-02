import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/login/login_cubit.dart';
import '../../../controller/login/login_state.dart';
import 'register_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LoginCubit>().state is LoginLoading;
    final loginCubit = context.read<LoginCubit>();

    final customTextFields = [
      CustomTextField(
        title: 'Email',
        hintText: 'Enter your email',
        icon: Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
        controller: loginCubit.emailController,

        validator: (value) => Validator.validateEmail(value),
      ),
      CustomTextField(
        title: 'Password',
        hintText: 'Enter your password',
        icon: Icon(Icons.lock_outline),
        keyboardType: TextInputType.text,
        controller: loginCubit.passwordController,
        validator: (value) => Validator.validatePassword(value),
        obscure: true,
      ),
    ];

    return Form(
      key: loginCubit.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => customTextFields[index],
            separatorBuilder: (context, index) => SizedBox(height: Sizes.md),
            itemCount: customTextFields.length,
          ),
          // SizedBox(height: Sizes.spaceBetweenItems),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.buttonMainColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: Sizes.spaceBetweenItems / 2),
          RegisterButton(
            isLoading: isLoading,
            buttonText: 'Sign in',
            shimmerButtonText: 'Signing in...',
            onPressed: () => loginCubit.login(),
          ),
        ],
      ),
    );
  }
}
