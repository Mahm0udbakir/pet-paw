import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/features/reset_password/controller/reset_password_cubit.dart';
import 'package:petpaw/app/features/reset_password/controller/reset_password_state.dart';
import '../../../../common/custom_text_field.dart';
import '../../../../core/utils/validators/validation.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<ResetPasswordCubit>().state is ResetPasswordLoading;
    final resetPasswordCubit = context.read<ResetPasswordCubit>();

    return Form(
        key: resetPasswordCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              title: 'Email',
              hintText: 'Enter your email',
              icon: Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              controller: resetPasswordCubit.emailController,
              validator: (value) => Validator.validateEmail(value),
            ),
          ],
        ));
  }
}
