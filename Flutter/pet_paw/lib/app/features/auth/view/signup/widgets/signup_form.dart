import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_state.dart';

import '../../../controller/signup/signup_cubit.dart';
import '../../login/widgets/register_button.dart';
import 'custom_password.dart';
import 'terms_and_conditions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<SignupCubit>().state is SignupLoading;
    final signupCubit = context.read<SignupCubit>();
    final customTextFields = [
      CustomTextField(
        title: 'Name',
        hintText: 'Enter your name',
        icon: Icons.person_outline,
        keyboardType: TextInputType.text,
        controller: signupCubit.nameController,
        validator: (value) => Validator.validateName(value),
      ),

      CustomTextField(
        title: 'Email',
        hintText: 'Enter your email',
        icon: Icons.email_outlined,
        keyboardType: TextInputType.emailAddress,
        controller: signupCubit.emailController,
        validator: (value) => Validator.validateEmail(value),
      ),

      CustomTextField(
        title: 'Phone Number',
        hintText: 'Enter your phone number',
        icon: Icons.phone_outlined,
        keyboardType: TextInputType.phone,
        controller: signupCubit.phoneController,
        validator: (value) =>
            Validator.validateEmptyText('Phone number', value),
      ),

      CustomPassword(
        controller: signupCubit.passwordController,
        showValidationError:
            !signupCubit.isPasswordValid && signupCubit.triedToSubmit,
      ),

      CustomTextField(
        title: 'Confirm your Password',
        hintText: 'Retype your password',
        icon: Icons.lock_outline,
        keyboardType: TextInputType.text,
        controller: signupCubit.confirmPasswordController,
        validator: (value) => Validator.validatePassword(value),
        obscure: true,
      ),
    ];

    return Form(
      key: signupCubit.signupFormKey,
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
          SizedBox(height: Sizes.spaceBetweenSections * 1.5),

          TermsAndConditions(),

          SizedBox(height: Sizes.spaceBetweenSections),
          RegisterButton(
            isLoading: isLoading,
            buttonText: 'Create Account',
            shimmerButtonText: 'Creating Account...',
            onPressed: () => signupCubit.signup(),
          ),
        ],
      ),
    );
  }
}
