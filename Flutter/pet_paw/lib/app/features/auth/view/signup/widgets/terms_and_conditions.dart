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
              return SizedBox(
                width: 20.w,
                child: Checkbox(
                  value: controller.terms,
                  onChanged: (value) => controller.toggleTerms(),
                  activeColor: AppColors.iconColor.withValues(alpha: 0.6),
                ),
              );
            },
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.termsIntro,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    color: AppColors.iconColor.withValues(alpha: 0.9),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: AppStrings.termsAndConditions,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.mainColor,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.and,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              color: AppColors.iconColor.withValues(alpha: 0.9),
                            ),
                      ),
                      TextSpan(
                        text: AppStrings.privacyPolicy,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.mainColor,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.mainColor,
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
