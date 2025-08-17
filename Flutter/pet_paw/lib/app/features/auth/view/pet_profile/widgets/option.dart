import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_colors.dart';

Widget buildOption(
  String value,
  BuildContext context,
  Function(String) onTap,
  bool isSelected,
) {
  return GestureDetector(
    onTap: () => onTap(value),
    child: AnimatedContainer(
      height: 40.h,
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected
              ? AppColors.selectedOption.withValues(alpha: 0.25)
              : AppColors.unselectedOption.withValues(alpha: 0.6),
          width: isSelected ? 0 : 1.w,
        ),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.mainColor
                    : AppColors.unselectedOption.withValues(alpha: 0.6),
                width: 2.w,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : AppColors.mainColor,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          SizedBox(width: 8.w),
          Text(
            value,
            style: TextStyle(
              color: isSelected
                  ? HelperFunctions.isDarkMode(context)
                        ? Colors.white
                        : AppColors.mainColor
                  : AppColors.unselectedOption.withValues(alpha: 0.6),
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    ),
  );
}
