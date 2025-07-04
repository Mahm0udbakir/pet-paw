import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_state.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/create_pet_profile_screen.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/signup/signup_cubit.dart';
import '../../login/widgets/register_button.dart';
import 'custom_password.dart';
import 'terms_and_conditions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final isLoading = context.watch<SignupCubit>().state is SignupLoading;
    final signupCubit = context.read<SignupCubit>();
    final customTextFields = [
      CustomTextField(
        title: 'Name',
        hintText: 'Enter your name',
        icon: Icon(Icons.person_outline),
        keyboardType: TextInputType.text,
        controller: signupCubit.nameController,
        validator: (value) => Validator.validateName(value),
      ),

      CustomTextField(
        title: 'Email',
        hintText: 'Enter your email',
        icon: Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
        controller: signupCubit.emailController,
        validator: (value) => Validator.validateEmail(value),
      ),

      CustomTextField(
        title: 'Phone Number',
        hintText: 'Enter your phone number',
        icon: Icon(Icons.phone_outlined),
        keyboardType: TextInputType.phone,
        controller: signupCubit.phoneController,
        validator: (value) => Validator.validatePhone(value),
      ),

      CustomPassword(
        controller: signupCubit.passwordController,
        showValidationError:
            !signupCubit.isPasswordValid && signupCubit.triedToSubmit,
        validator: (value) => Validator.validatePassword(value),
      ),

      CustomTextField(
        title: 'Confirm your Password',
        hintText: 'Retype your password',
        icon: Icon(Icons.lock_outline),
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
          // RegisterButton(
          //   isLoading: isLoading,
          //   buttonText: 'Create Account',
          //   shimmerButtonText: 'Creating Account...',
          //   onPressed: () => signupCubit.signup(),
          // ),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                backgroundColor: AppColors.buttonMainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                if (signupCubit.signupFormKey.currentState!.validate()) {
                  signupCubit.signup();
                  Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CreatePetProfileScreen()),
              );
                }
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
