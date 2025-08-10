import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_text_field.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../controller/reset_password_cubit.dart';
import 'custom_new_password.dart';

class ResetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomNewPassword(
            controller: cubit.newPasswordController,
            showValidationError: !cubit.isPasswordValid && cubit.triedToSubmit,
            validator: (value) => Validator.validatePassword(value),
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            title: AppStrings.confirmPasswordTitle,
            hintText: AppStrings.retypePassword,
            icon: const Icon(Icons.lock_outline),
            keyboardType: TextInputType.text,
            controller: cubit.confirmNewPasswordController,
            validator: (value) => Validator.validatePassword(value),
            obscure: true,
            currentFocusNode: cubit.confirmNewPasswordFocus,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
