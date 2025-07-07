import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/custom_dark_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/reset_password_cubit.dart';
import '../../../controller/reset_password_state.dart';
import 'countdown_timer_text.dart';
import 'no_receive_otp.dart';
import 'otp_verification_form.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});

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
                "Enter the code we sent to your mobile number/email address.",
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const ResetPasswordScreen(),
                  //     )
                  // );

                } else if (state is ResetPasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<ResetPasswordCubit>();
                final isLoading = state is ResetPasswordLoading;

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 240,
                  child: Column(
                    children: [

                      CountdownTimerText(
                        seconds: 180, // 3 minutes
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.iconColor,
                          fontWeight: FontWeight.w400,
                        ),
                        onFinished: () {
                          // Show a message or disable inputs
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Time expired. Please resend OTP.")),
                          );
                        },
                      ),
                      const SizedBox(height: 48),
                      const OtpVerificationForm(),
                      const SizedBox(height: 48),
                      const NoReceiveOtp(),
                      const Spacer(),
                      CustomDarkButton(
                        text: 'Submit',
                        onPressed: isLoading ? null : cubit.forgetPassword,
                        child: isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : const Text("Submit"),
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
