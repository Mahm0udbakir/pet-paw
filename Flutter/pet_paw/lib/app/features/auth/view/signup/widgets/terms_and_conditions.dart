import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/signup/signup_cubit.dart';

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
          Checkbox(
            value: controller.terms,
            onChanged: (value) => controller.toggleTerms(),
            activeColor: AppColors.buttonMainColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'By creating your account you agree to our ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.buttonMainColor,
                      decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: ' and ',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.grey,
                            ),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.buttonMainColor,
                              decoration: TextDecoration.underline,
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
