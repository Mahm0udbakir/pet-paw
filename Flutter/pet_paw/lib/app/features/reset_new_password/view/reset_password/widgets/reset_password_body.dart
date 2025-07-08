import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/features/reset_new_password/view/reset_password/widgets/reset_password_form.dart';

import '../../../../../common/custom_dark_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/reset_password_cubit.dart';
import '../../../controller/reset_password_state.dart';

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
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.xxl),
              child: Text(
                "Enter your new  password.",
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
                  height: MediaQuery.of(context).size.height - 220,
                  child: Column(
                    children: [
                      const ResetPasswordForm(),
                      const Spacer(),
                      CustomDarkButton(
                        text: 'Continue',
                        onPressed: () {},
                       //isLoading ? null : cubit.forgetPassword,
                        child: (){}
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
