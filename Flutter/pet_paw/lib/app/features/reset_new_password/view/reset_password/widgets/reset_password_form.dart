import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_text_field.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../controller/reset_password_cubit.dart';
import 'CustomNewPassword.dart';


class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    final GlobalKey<FormState> formKeyReset = GlobalKey<FormState>();
    return Form(
      key: formKeyReset,
      child: Column(
        children: [
          CustomNewPassword(
            controller: cubit.newPasswordController,
            showValidationError:
            !cubit.isPasswordValid && cubit.triedToSubmit,
            validator: (value) => Validator.validatePassword(value),
          ),
          SizedBox(
            height: 24.0,
          ),

          CustomTextField(
            title: 'Confirm your Password',
            hintText: 'Retype your password',
            icon: Icon(Icons.lock_outline),
            keyboardType: TextInputType.text,
            controller: cubit.confirmNewPasswordController,
            validator: (value) => Validator.validatePassword(value),
            obscure: true,
            currentFocusNode: cubit.confirmNewPasswordFocus,
            isLast: true,
            onSubmit: () {
              if (formKeyReset.currentState!.validate()) {
                // Navigator.push(
                //   context,
                // );
              }
            },
          ),
        ],
      ),
    );
  }
}
