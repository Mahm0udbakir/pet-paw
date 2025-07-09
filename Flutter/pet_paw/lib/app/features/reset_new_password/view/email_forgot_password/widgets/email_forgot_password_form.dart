import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_text_field.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../controller/reset_password_cubit.dart';

class EmailForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const EmailForgotPasswordForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            title: 'Email',
            hintText: 'Enter your email',
            icon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            controller: cubit.emailController,
            validator: Validator.validateEmail,
            currentFocusNode: cubit.emailFocus,
          ),
        ],
      ),
    );
  }
}
