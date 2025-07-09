import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_dark_button.dart';
import '../../../../../common/custom_light_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/reset_password_cubit.dart';
import '../../../controller/reset_password_state.dart';
import '../../email_forgot_password/email_forgot_password_screen.dart';
import '../../otp_verification/otp_verification_screen.dart';
import 'phone_forgot_password_form.dart';

class PhoneForgotPasswordBody extends StatelessWidget {
  const PhoneForgotPasswordBody({super.key});

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.xxl),
              child: Text(
                "Enter your mobile number and we will send you an OTP to reset password.",
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<ResetPasswordCubit>();
                final isLoading = state is ForgotPasswordLoading;

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 260,
                  child: Column(
                    children: [
                      const PhoneForgotPasswordForm(),
                      const Spacer(),
                      CustomDarkButton(
                        text: 'Continue',
                        onPressed: isLoading ? null : cubit.forgetPassword,
                      ),
                      const SizedBox(height: Sizes.spaceBetweenSections),
                      CustomLightButton(
                        text: 'Reset using email',
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailForgotPasswordScreen(),
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
