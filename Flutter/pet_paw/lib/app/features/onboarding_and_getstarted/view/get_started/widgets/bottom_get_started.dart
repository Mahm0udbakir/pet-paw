import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';
import 'package:petpaw/app/common/custom_light_button.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';
import 'package:petpaw/app/features/auth/controller/signup/signup_cubit.dart';
import 'package:petpaw/app/features/auth/view/signup/signup_screen.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../auth/view/login/login_screen.dart';

class BottomGetStarted extends StatelessWidget {
  const BottomGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomDarkButton(
            text: AppStrings.signUp,
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SignupCubit(),
                  child: SignupScreen(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Sizes.md.h),
        SizedBox(
          width: double.infinity,
          child: CustomLightButton(
            text: AppStrings.signIn,
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: LoginScreen(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Sizes.md.h),
        SizedBox(
          width: double.infinity,
          child: CustomLightButton(
            text: AppStrings.continueAsGuest,
            onPressed: () => showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '😂عارف انك هتجرب تدوس هنا بس انا لسه مشغلتش الزرار ده',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: Sizes.xl.h),
        Text.rich(
          TextSpan(
            text: AppStrings.agreementPrefix,
            style: TextStyle(
              color: isDark ? Color(0xffBDBDBD) : AppColors.gray,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              fontFamily: 'Poppins',
            ),
            children: [
              TextSpan(
                text: AppStrings.terms,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainColor,
                  fontFamily: 'Poppins',
                ),
              ),
              TextSpan(
                text: AppStrings.and,
                style: TextStyle(
                  color: isDark ? Color(0xffBDBDBD) : AppColors.gray,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                ),
              ),
              TextSpan(
                text: AppStrings.privacyPolicy,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
