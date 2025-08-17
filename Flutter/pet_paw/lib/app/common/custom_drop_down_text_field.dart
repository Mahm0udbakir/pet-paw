import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/core/utils/constants/app_strings.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';
import '../core/utils/constants/app_colors.dart';

class CustomDropDownTextField extends FormField<String> {
  CustomDropDownTextField({
    super.key,
    required List<String> items,
    required void Function(String?)? onChanged,
    required String title,
    required String hintText,
    required String? value,
    required String prefixIcon,
    String? Function(String?)? validator,
  }) : super(
         initialValue: value,
         validator: validator,
         builder: (FormFieldState<String> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               customLabel(title, state.context),
               SizedBox(height: 5.h),
               InkWell(
                 onTap: () {
                   final data = items
                       .map((e) => SelectedListItem<String>(data: e))
                       .toList();

                   DropDownState<String>(
                     dropDown: DropDown<String>(
                       data: data,
                       bottomSheetTitle: Text(
                         hintText,
                         style: TextStyle(
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w600,
                           fontFamily: 'Poppins',
                           color: AppColors.mainColor,
                         ),
                       ),
                       enableMultipleSelection: false,
                       onSelected: (selected) {
                         if (selected.isNotEmpty) {
                           state.didChange(selected.first.data);
                           onChanged?.call(selected.first.data);
                         } else {
                           state.didChange(null);
                           onChanged?.call(null);
                         }
                       },
                       searchWidget: TextFormField(
                         decoration: InputDecoration(
                           hintText: AppStrings.search,
                           hintStyle: TextStyle(
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w400,
                             fontFamily: 'Poppins',
                             color: AppColors.iconColor.withValues(alpha: 0.6),
                           ),
                           contentPadding: EdgeInsets.symmetric(
                             horizontal: 16.w,
                           ),
                         ),
                       ),
                     ),
                   ).showModal(state.context);
                 },
                 child: Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(
                     vertical: 10.h,
                     horizontal: 16.w,
                   ),
                   decoration: BoxDecoration(
                     color: AppColors.textFormFillColor.withValues(alpha: 0.05),
                     borderRadius: BorderRadius.circular(16.r),
                     border: Border.all(
                       color: state.hasError ? Colors.red : Colors.transparent,
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SvgPicture.asset(prefixIcon),
                       SizedBox(width: 8.w),
                       Expanded(
                         child: Text(
                           state.value ?? hintText,
                           style: Theme.of(state.context).textTheme.bodyMedium
                               ?.copyWith(
                                 fontSize: 14.sp,
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w400,
                                 color: state.value == null
                                     ? HelperFunctions.isDarkMode(state.context)
                                           ? Colors.white
                                           : AppColors.iconColor.withValues(
                                               alpha: 0.6,
                                             )
                                     : AppColors.iconColor.withValues(
                                         alpha: 0.6,
                                       ),
                               ),
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       SvgPicture.asset(
                         ImagesStrings.dropDownIcon,
                         height: 24.h,
                       ),
                     ],
                   ),
                 ),
               ),
               if (state.hasError)
                 Padding(
                   padding: EdgeInsets.only(top: 5.h, left: 4.w),
                   child: Text(
                     state.errorText ?? '',
                     style: TextStyle(color: Colors.red, fontSize: 12.sp),
                   ),
                 ),
             ],
           );
         },
       );
}
