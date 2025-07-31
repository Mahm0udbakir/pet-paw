import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../controller/signup/signup_cubit.dart';
import '../../../controller/signup/signup_state.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignupCubit>();
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Checkbox(
                value: controller.terms,
                onChanged: (value) => controller.toggleTerms(),
                activeColor: AppColors.buttonMainColor,
              );
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.termsIntro,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: AppStrings.termsAndConditions,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: AppColors.buttonMainColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.buttonMainColor,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.and,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.grey,
                            ),
                      ),
                      TextSpan(
                        text: AppStrings.privacyPolicy,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: AppColors.buttonMainColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.buttonMainColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
