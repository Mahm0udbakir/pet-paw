import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../reset_new_password/view/email_forgot_password/email_forgot_password_screen.dart';
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
        title: AppStrings.emailTitle,
        hintText: AppStrings.emailHint,
        icon: Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
        controller: loginCubit.emailController,
        validator: (value) => Validator.validateEmail(value),
        currentFocusNode: loginCubit.emailFocus,
        nextFocusNode: loginCubit.passwordFocus,
      ),
      CustomTextField(
        title: AppStrings.passwordTitle,
        hintText: AppStrings.passwordHint,
        icon: Icon(Icons.lock_outline),
        keyboardType: TextInputType.text,
        controller: loginCubit.passwordController,
        validator: (value) => Validator.validatePassword(value),
        obscure: true,
        currentFocusNode: loginCubit.passwordFocus,
        onSubmit: () => loginCubit.login(),
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
            separatorBuilder: (context, index) =>
                SizedBox(height: Sizes.spaceBetweenInputFields.h),
            itemCount: customTextFields.length,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmailForgotPasswordScreen(),
                  ),
                );
              },
              child: Text(
                AppStrings.forgotPassword,
                style: TextStyle(
                  color: AppColors.buttonMainColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.buttonMainColor,
                ),
              ),
            ),
          ),
          SizedBox(height: Sizes.spaceBetweenItems / 2.h),
          RegisterButton(
            isLoading: isLoading,
            buttonText: AppStrings.loginButton,
            shimmerButtonText: AppStrings.loginLoadingButton,
            onPressed: () => loginCubit.login(),
          ),
        ],
      ),
    );
  }
}
