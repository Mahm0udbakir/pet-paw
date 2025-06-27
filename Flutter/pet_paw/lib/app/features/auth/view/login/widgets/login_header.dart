import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';

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
        SizedBox(height: Sizes.spaceBetweenItems),
        SvgPicture.asset(ImagesStrings.appLogo, height: 160),
        SizedBox(height: Sizes.spaceBetweenItems),
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
