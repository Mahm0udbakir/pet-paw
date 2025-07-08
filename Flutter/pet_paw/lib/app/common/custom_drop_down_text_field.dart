import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../core/utils/constants/app_colors.dart';
import '../common/custom_label.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    required this.hintText,
    required this.value,
    required this.controller,
  });

  final List<String> items;
  final void Function(String?)? onChanged;
  final String title;
  final String hintText;
  final String? value;
  final SingleSelectController<String> controller;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(title, context),
        SizedBox(height: 5.h),

        CustomDropdown<String>.search(
          hintText: hintText,
          items: items,
          controller: controller,
          decoration: CustomDropdownDecoration(
            closedFillColor: Colors.white,
            closedBorder: Border.all(color: Colors.brown.shade100, width: 1.w),
            closedBorderRadius: BorderRadius.circular(50),
            closedSuffixIcon: const Icon(
              Iconsax.arrow_down_1,
              size: 20,
              color: AppColors.buttonMainColor,
            ),
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.iconColor,
              fontSize: 14.sp,
            ),
            headerStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.brown.shade500,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            expandedBorderRadius: BorderRadius.circular(12),
          ),
          onChanged: (val) => onChanged?.call(val),
        ),
      ],
    );
  }
}
