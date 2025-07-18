import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

import '../../../controller/on_boarding_cubit.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () => context.read<OnBoardingCubit>().skipPage(),
        icon: Icon(
          Icons.skip_next_outlined,
          color: AppColors.iconColor,
          size: 16,
        ),
        label: Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.buttonMainColor,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
