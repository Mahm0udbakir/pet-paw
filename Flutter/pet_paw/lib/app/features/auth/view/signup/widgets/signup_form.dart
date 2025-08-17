import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/helpers/loaders.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/controller/create_pet_profile/stepper_cubit.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_state.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/create_pet_profile_screen.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/create_pet_profile/core_dialog.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../controller/signup/signup_cubit.dart';
import 'custom_password.dart';
import 'terms_and_conditions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    final customTextFields = [
      CustomTextField(
        title: AppStrings.nameFieldTitle,
        hintText: AppStrings.nameFieldHint,
        icon: Icon(
          Icons.person_outline,
          color: AppColors.iconColor.withValues(alpha: 0.6),
        ),
        keyboardType: TextInputType.text,
        controller: signupCubit.nameController,
        validator: (value) => Validator.validateName(value),
        currentFocusNode: signupCubit.nameFocus,
        nextFocusNode: signupCubit.emailFocus,
      ),

      CustomTextField(
        title: AppStrings.emailFieldTitle,
        hintText: AppStrings.emailFieldHint,
        icon: SvgPicture.asset(ImagesStrings.emailIcon),
        keyboardType: TextInputType.emailAddress,
        controller: signupCubit.emailController,
        validator: (value) => Validator.validateEmail(value),
        currentFocusNode: signupCubit.emailFocus,
        nextFocusNode: signupCubit.phoneFocus,
      ),

      CustomTextField(
        title: AppStrings.phoneFieldTitle,
        hintText: AppStrings.phoneFieldHint,
        icon: Icon(
          Icons.phone_outlined,
          color: AppColors.iconColor.withValues(alpha: 0.6),
        ),
        keyboardType: TextInputType.phone,
        controller: signupCubit.phoneController,
        validator: (value) => Validator.validatePhone(value),
        currentFocusNode: signupCubit.phoneFocus,
        nextFocusNode: signupCubit.passwordFocus,
      ),

      CustomPassword(
        controller: signupCubit.passwordController,
        showValidationError:
            !signupCubit.isPasswordValid && signupCubit.triedToSubmit,
        validator: (value) => Validator.validatePassword(value),
      ),

      CustomTextField(
        title: AppStrings.confirmPasswordTitle,
        hintText: AppStrings.confirmPasswordHint,
        icon: Icon(
          Icons.lock_outline,
          color: AppColors.iconColor.withValues(alpha: 0.6),
        ),
        keyboardType: TextInputType.text,
        controller: signupCubit.confirmPasswordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.confirmPasswordEmptyError;
          }
          if (value != signupCubit.passwordController.text.trim()) {
            return AppStrings.passwordsNotMatch;
          }
          return null;
        },

        obscure: true,
        currentFocusNode: signupCubit.confirmPasswordFocus,
        isLast: true,
      ),
    ];

    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupError) {
          Loaders.errorSnackBar(context: context, title: state.message);
        }
        if (state is DetailedSignupError) {
          Loaders.errorSnackBar(context: context, title: state.message);
        }
      },
      child: Form(
        key: signupCubit.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => customTextFields[index],
              separatorBuilder: (context, index) =>
                  SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
              itemCount: customTextFields.length,
            ),
            SizedBox(height: Sizes.spaceBetweenSections.h),

            TermsAndConditions(),

            SizedBox(height: Sizes.spaceBetweenSections.h),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                // onPressed: () async {
                //   if (signupCubit.signupFormKey.currentState!.validate() &&
                //       signupCubit.isPasswordConfirmed(
                //         signupCubit.passwordController.text.trim(),
                //         signupCubit.confirmPasswordController.text.trim(),
                //       )) {
                //     showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (BuildContext context) {
                //         return const Dialog(
                //           backgroundColor: Colors.transparent,
                //           elevation: 0,
                //           child: Center(
                //             child: CircularProgressIndicator(
                //               color: AppColors.buttonMainColor,
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //     final success = await signupCubit.signup();
                //     Navigator.of(context).pop();
                //     if (success) {
                //       // Navigator.push(
                //       //   context,
                //       //   CupertinoPageRoute(
                //       //     builder: (context) =>
                //       //         CreatePetProfileScreen(isFirstTime: true),
                //       //   ),
                //       // );
                //     }
                //   }
                // },
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => StepperCubit(),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const CoreDialog(),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  AppStrings.next,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
