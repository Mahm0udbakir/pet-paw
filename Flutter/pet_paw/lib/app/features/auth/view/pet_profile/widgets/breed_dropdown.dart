import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_label.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';

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
  String? customBreed;
  bool showCustomInput = false;

  @override
  Widget build(BuildContext context) {
    final displayedText = showCustomInput
        ? (customBreed?.isNotEmpty == true
              ? customBreed!
              : AppStrings.enterBreedHint)
        : (widget.selectedBreed ?? AppStrings.choosePetBreed);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(AppStrings.petBreedLabel, context),
        SizedBox(height: 5.h),

        InkWell(
          onTap: () => _showDropDown(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.brown.shade100, width: 1.w),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    displayedText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: (widget.selectedBreed == null && !showCustomInput)
                          ? AppColors.iconColor
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: AppColors.iconColor),
              ],
            ),
          ),
        ),

        if (showCustomInput) ...[
          SizedBox(height: 8.h),
          TextFormField(
            initialValue: customBreed,
            onChanged: (value) {
              setState(() {
                customBreed = value;
              });
              widget.onChanged(value.isNotEmpty ? value : null);
            },
            decoration: InputDecoration(
              hintText: AppStrings.enterBreedHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showDropDown(BuildContext context) {
    final options = widget.options
        .map((e) => SelectedListItem(data: e))
        .toList();

    DropDownState(
      dropDown: DropDown(
        data: options,
        bottomSheetTitle: Text(
          AppStrings.choosePetBreed,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        onSelected: (selectedItems) {
          if (selectedItems.isNotEmpty) {
            final selected = selectedItems.first.data;

            setState(() {
              showCustomInput = false;
              customBreed = null;
              widget.onChanged(selected);
            });
          }
        },
      ),
    ).showModal(context);
  }
}
