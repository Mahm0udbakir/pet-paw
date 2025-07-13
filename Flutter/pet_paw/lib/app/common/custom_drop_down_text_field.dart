import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_label.dart';
import '../core/utils/constants/app_colors.dart';

class CustomDropDownTextField extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final String title;
  final String hintText;
  final String? value;

  const CustomDropDownTextField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    required this.hintText,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(title, context),
        SizedBox(height: 5.h),
        InkWell(
          onTap: () => _showDropdown(context),
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
                    value ?? hintText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: value == null ? AppColors.iconColor : Colors.black,
                          fontSize: 14.sp,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.iconColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDropdown(BuildContext context) {
    final data = items.map((e) => SelectedListItem<String>(data: e)).toList();
    DropDownState<String>(
      dropDown: DropDown<String>(
        data: data,
        bottomSheetTitle: Text(
          hintText,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        enableMultipleSelection: false,
        onSelected: (selected) {
          if (selected.isNotEmpty) {
            onChanged?.call((selected.first).data);
          } else {
            onChanged?.call(null);
          }
        },
        searchWidget: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
    ).showModal(context);
  }
}
