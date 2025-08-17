import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/password_cloud.dart';
import '../../../../../common/custom_label.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../controller/signup/signup_cubit.dart';
import '../../../model/validation_status_model.dart';
import 'password_strength_label.dart';

class CustomPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool showValidationError;
  final String? Function(String?)? validator;

  const CustomPassword({
    super.key,
    required this.controller,
    this.showValidationError = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignupCubit>();
    final isValid = cubit.isPasswordValid;
    final isDark = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(AppStrings.passwordTitle, context),
        SizedBox(height: 8.h),
        Stack(
          children: [
            TextFormField(
              controller: controller,
              obscureText: cubit.isPasswordObscured,
              onChanged: cubit.validatePassword,
              validator: validator,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: isDark
                    ? Colors.white
                    : AppColors.iconColor.withValues(alpha: 0.6),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff000000).withValues(alpha: 0.05),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors.iconColor.withValues(alpha: 0.6),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.text.isNotEmpty && !isValid)
                      ValidationPopoverIcon(
                        validation: ValidationStatus(
                          hasMinLength: cubit.hasMinLength,
                          hasNumber: cubit.hasNumber,
                          hasUpper: cubit.hasUpper,
                          hasLower: cubit.hasLower,
                          hasSpecial: cubit.hasSpecial,
                        ),
                      ),
                    IconButton(
                      onPressed: cubit.togglePasswordVisibility,
                      icon: Icon(
                        cubit.isPasswordObscured
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: isDark
                            ? AppColors.iconColor
                            : AppColors.iconColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                hintText: AppStrings.passwordHint,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? Colors.white
                      : AppColors.iconColor.withValues(alpha: 0.6),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.2.w,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 1.2.w,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.2.w,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 15.w),
            if (controller.text.isNotEmpty && !isValid)
              PasswordStrengthLabel(passedCount: cubit.passwordStrengthCount),
          ],
        ),
      ],
    );
  }
}
