import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';

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
                prefixIcon: Icon(Icons.lock, color: AppColors.iconColor),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showValidationError && !isValid)
                      IconButton(
                        onPressed: () => _showValidationPopover(context, cubit),
                        icon: const Icon(Icons.error, color: Colors.red),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
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

  void _showValidationPopover(BuildContext context, SignupCubit cubit) {
    showPopover(
      context: context,
      bodyBuilder: (context) => Container(
        padding: const EdgeInsets.all(20),
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPopoverCheck(
              cubit.hasMinLength,
              'Must be at 8-20 characters.',
            ),
            _buildPopoverCheck(
              cubit.hasNumber,
              'Must include at least 1 number.',
            ),
            _buildPopoverCheck(
              cubit.hasUpper,
              'Must contain at least 1 uppercase letter. ',
            ),
            _buildPopoverCheck(
              cubit.hasLower,
              'Must contain at least 1 lowercase letter. ',
            ),
            _buildPopoverCheck(
              cubit.hasSpecial,
              'Must include at least 1 special character (e.g.!,@,#).',
            ),
          ],
        ),
      ),
      direction: PopoverDirection.top,
      width: 380,
      arrowHeight: 15,
      arrowWidth: 30,
      backgroundColor: AppColors.white,
      radius: 10,
      transition: PopoverTransition.scale,
      transitionDuration: const Duration(milliseconds: 150),
      barrierColor: Colors.transparent,
    );
  }

  Widget _buildPopoverCheck(bool condition, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            condition ? Icons.check : Icons.close,
            color: condition ? Colors.green : Colors.red,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.black, fontSize: 13)),
        ],
      ),
    );
  }
}
