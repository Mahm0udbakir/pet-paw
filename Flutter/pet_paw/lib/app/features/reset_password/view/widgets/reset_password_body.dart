import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_light_button.dart';
import '../../../../common/custom_dark_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../controller/reset_password_cubit.dart';
import '../../controller/reset_password_state.dart';
import 'reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.xxl),
              child: Text(
                "Enter your email address and we will send you an OTP to reset password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.smallTextColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  // Navigator.push(...)
                } else if (state is ResetPasswordError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                final cubit = context.read<ResetPasswordCubit>();

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 220,
                      // MediaQuery.of(context).padding.top*100,
                  child: Column(
                    children: [
                      ResetPasswordForm(),
                      const Spacer(),
                      CustomDarkButton(
                        text: 'Continue',
                        onPressed:
                            state is ResetPasswordLoading
                                ? null
                                : () => cubit.forgetPassword(),
                        child:
                            state is ResetPasswordLoading
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : const Text("Continue"),
                      ),
                      SizedBox(
                        height: Sizes.spaceBetweenItems,
                      ),
                      CustomLightButton(text: 'Reset using mobile number', onPressed: () {}, child: () {}),
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
