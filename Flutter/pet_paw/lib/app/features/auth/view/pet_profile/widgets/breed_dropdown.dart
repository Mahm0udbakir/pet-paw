import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/custom_label.dart';
import '../../../../../core/utils/constants/app_colors.dart';

class BreedDropdown extends StatefulWidget {
  final List<String> options;
  final String? selectedBreed;
  final ValueChanged<String?> onChanged;

  const BreedDropdown({
    required this.options,
    required this.selectedBreed,
    required this.onChanged,
    super.key,
  });

  @override
  State<BreedDropdown> createState() => _BreedDropdownState();
}

class _BreedDropdownState extends State<BreedDropdown> {
  late SingleSelectController<String> _controller;

  @override
  void initState() {
    super.initState();
    _controller = SingleSelectController<String>(null);
    _syncController();
  }

  @override
  void didUpdateWidget(BreedDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.options != widget.options ||
        oldWidget.selectedBreed != widget.selectedBreed) {
      _syncController();
    }
  }

  void _syncController() {
    if (widget.selectedBreed != null &&
        widget.options.contains(widget.selectedBreed)) {
      _controller.value = widget.selectedBreed;
    } else {
      _controller.value = null;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel('Pet Breed', context),
        SizedBox(height: 5.h),

        CustomDropdown<String>.search(
          hintText: 'Choose your pet breed',
          controller: _controller,
          items: widget.options,
          onChanged: widget.onChanged,
          decoration: CustomDropdownDecoration(
            searchFieldDecoration: SearchFieldDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.brown.shade100,
                  width: 1.w,
                ),
              ),
            ),
            closedFillColor: Colors.white,
            closedBorder: Border.all(color: Colors.brown.shade100, width: 1.w),
            closedBorderRadius: BorderRadius.circular(12),
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
            closedErrorBorderRadius: BorderRadius.circular(50),
          ),
          disabledDecoration: CustomDropdownDisabledDecoration(
            borderRadius: BorderRadius.circular(50),
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.iconColor,
              fontSize: 14.sp,
            ),
            headerStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.brown.shade500,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
