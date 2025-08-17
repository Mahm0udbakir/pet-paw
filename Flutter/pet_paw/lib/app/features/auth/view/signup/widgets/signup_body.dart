import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/signup_form.dart';

import '../../../../../core/utils/constants/app_strings.dart';
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
              AppStrings.createAccountTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
                fontFamily: 'Poppins',
                color: AppColors.mainColor,
              ),
            ),
            SizedBox(height: Sizes.defaultSpace + 4.h),
            SignupForm(),
            SizedBox(height: Sizes.defaultSpace.h),
            Text.rich(
              TextSpan(
                text: AppStrings.alreadyHaveAccount,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.iconColor.withValues(alpha: 0.9),
                ),
                children: [
                  TextSpan(
                    text: AppStrings.signIn,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: AppColors.mainColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => LoginCubit(),
                              child: const LoginScreen(),
                            ),
                          ),
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
