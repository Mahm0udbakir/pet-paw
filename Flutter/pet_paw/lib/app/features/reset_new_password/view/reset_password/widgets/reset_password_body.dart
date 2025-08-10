import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';
import 'package:petpaw/app/features/reset_new_password/view/reset_password/widgets/reset_password_form.dart';

import '../../../../../common/custom_dark_button.dart';
import '../../../../../common/done_screen.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../auth/view/login/login_screen.dart';
import '../../../controller/reset_password_cubit.dart';
import '../../../controller/reset_password_state.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formKeyReset = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.defaultSpace,
        horizontal: Sizes.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.xxl),
              child: Text(
                AppStrings.enterNewPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.smallTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 46),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoneScreen(
                        message: AppStrings.passwordUpdated,
                        imageAsset: ImagesStrings.successCharacter,
                        description: AppStrings.passwordUpdatedDesc,
                        buttonText: AppStrings.login,
                        nextScreen: BlocProvider(
                          create: (context) => LoginCubit(),
                          child: LoginScreen(),
                        ),
                      ),
                    ),
                    (route) => false,
                  );
                } else if (state is ResetPasswordError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                final cubit = context.read<ResetPasswordCubit>();
                final isLoading = state is ResetPasswordLoading;

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 220,
                  child: Column(
                    children: [
                      ResetPasswordForm(formKey: formKeyReset),
                      const Spacer(),
                      CustomDarkButton(
                        text: AppStrings.continueButton,
                        onPressed: isLoading
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                if (formKeyReset.currentState!.validate()) {
                                  cubit.resetPassword();
                                }
                              },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
