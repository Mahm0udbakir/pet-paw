import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/helpers/loaders.dart';
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
      padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: Sizes.lg.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(),
            SizedBox(height: Sizes.xl + 8.h),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Loaders.successSnackBar(
                    context: context,
                    title: AppStrings.loginSuccessTitle,
                    message: AppStrings.loginSuccessMessage,
                  );
                } else if (state is LoginError) {
                  Loaders.errorSnackBar(
                    context: context,
                    title: AppStrings.loginFailedTitle,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                return const LoginForm();
              },
            ),
            SizedBox(height: Sizes.defaultSpace / 2.h),
            Align(
              alignment: HelperFunctions.isArabic(context)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                AppStrings.orSignInWith,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: AppColors.mainColor,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            SizedBox(height: Sizes.spaceBetweenItems.h),
            SocialButtons(),
            SizedBox(height: Sizes.spaceBetweenItems.h),
            Text.rich(
              TextSpan(
                text: AppStrings.noAccountYet,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.iconColor.withValues(alpha: 0.9),
                  fontFamily: 'Poppins',
                ),
                children: [
                  TextSpan(
                    text: AppStrings.createOne,
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
                            builder: (context) => const SignupScreen(),
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
