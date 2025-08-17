import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/constants/app_colors.dart';
import '../core/utils/helpers/helper_functions.dart';

Widget customLabel(String label, BuildContext context) {
  final isDark = HelperFunctions.isDarkMode(context);
  return Text(
    label,
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: isDark
          ? Color(0xffBDBDBD)
          : AppColors.iconColor.withValues(alpha: 0.9),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      fontFamily: 'Poppins',
    ),
  );
}
