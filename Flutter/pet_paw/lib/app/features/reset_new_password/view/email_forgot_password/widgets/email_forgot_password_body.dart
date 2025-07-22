import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_dark_button.dart';
import '../../../../../common/custom_light_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/reset_password_cubit.dart';
import '../../../controller/reset_password_state.dart';
import '../../otp_verification/otp_verification_screen.dart';
import '../../phone_forgot_password/phone_forgot_password_screen.dart';
import 'email_forgot_password_form.dart';

class EmailForgotPasswordBody extends StatelessWidget {
  const EmailForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                AppStrings.enterEmailToReset,
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
                if (state is ForgotPasswordSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<ResetPasswordCubit>(),
                        child: const OtpVerificationScreen(),
                      ),
                    ),
                  );
                } else if (state is ForgotPasswordError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                final cubit = context.read<ResetPasswordCubit>();
                final isLoading = state is ForgotPasswordLoading;

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 260,
                  child: Column(
                    children: [
                      EmailForgotPasswordForm(formKey: formKey),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: CustomDarkButton(
                          text: AppStrings.continueButton,
                          onPressed: isLoading
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    cubit.forgetPassword();
                                  }
                                },
                        ),
                      ),
                      const SizedBox(height: Sizes.spaceBetweenSections),
                      SizedBox(
                        width: double.infinity,
                        child: CustomLightButton(
                          text: AppStrings.resetUsingMobile,
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PhoneForgotPasswordScreen(),
                            ),
                          ),
                        ),
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
