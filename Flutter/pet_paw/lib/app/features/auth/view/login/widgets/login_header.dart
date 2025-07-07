import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/auth/view/login/widgets/animated_login_logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome Back to',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
        ),
        SizedBox(height: Sizes.spaceBetweenItems.h),
        // SvgPicture.asset(ImagesStrings.appLogo, height: 160.h),
        AnimatedLoginLogo(),
        SizedBox(height: Sizes.spaceBetweenItems.h),
        Text(
          'sign in to your account',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.buttonMainColor,
          ),
        ),
      ],
    );
  }
}
