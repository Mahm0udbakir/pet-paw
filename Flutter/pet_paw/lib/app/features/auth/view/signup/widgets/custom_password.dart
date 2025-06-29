import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/password_cloud.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/signup/signup_cubit.dart';
import 'password_strength_label.dart';

class CustomPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool showValidationError;

  const CustomPassword({
    super.key,
    required this.controller,
    this.showValidationError = false,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignupCubit>();
    final isValid = cubit.isPasswordValid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            TextFormField(
              controller: controller,
              obscureText: cubit.isPasswordObscured,
              onChanged: cubit.validatePassword,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: Colors.brown.shade500,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                prefixIcon: Icon(Icons.lock_outline, color: AppColors.iconColor),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.text.isNotEmpty && !isValid)
                      ValidationPopoverIcon(
                      cubit: cubit,
                      showBubble: true,
                    ),
                    IconButton(
                      onPressed: cubit.togglePasswordVisibility,
                      icon: Icon(
                        cubit.isPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
                hintText: "Enter your password",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.iconColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.brown.shade100,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.brown.shade200,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.brown.shade100,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 15),
            PasswordStrengthLabel(passedCount: cubit.passwordStrengthCount),
          ],
        ),
      ],
    );
  }
}
