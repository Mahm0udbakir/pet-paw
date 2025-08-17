import 'package:flutter/material.dart';
import 'package:petpaw/app/features/reset_new_password/view/reset_password/widgets/reset_password_body.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/constants/sizes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.resetPassword,
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SafeArea(child: ResetPasswordBody()),
    );
  }
}
