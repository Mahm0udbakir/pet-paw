import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/constants/app_colors.dart';

Widget customLabel(String label, BuildContext context) {
  return Text(
    label,
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: AppColors.greyColor,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
  );
}
