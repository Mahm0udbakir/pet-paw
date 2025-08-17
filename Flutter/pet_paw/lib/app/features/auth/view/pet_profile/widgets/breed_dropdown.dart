import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/custom_label.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class BreedDropdown extends FormField<String> {
  BreedDropdown({
    required List<String> options,
    required String? selectedBreed,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
    Key? key,
  }) : super(
         key: key,
         initialValue: selectedBreed,
         validator: validator,
         builder: (FormFieldState<String> state) {
           String? customBreed;
           bool showCustomInput = false;

           void _showDropDown(BuildContext context) {
             final items = options
                 .map((e) => SelectedListItem(data: e))
                 .toList();
             DropDownState(
               dropDown: DropDown(
                 data: items,
                 searchWidget: TextFormField(
                   decoration: InputDecoration(
                     hintText: AppStrings.search,
                     hintStyle: TextStyle(
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Poppins',
                       color: AppColors.iconColor.withValues(alpha: 0.6),
                     ),
                     contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                   ),
                 ),
                 bottomSheetTitle: Text(
                   AppStrings.choosePetBreed,
                   style: TextStyle(
                     fontSize: 18.sp,
                     fontWeight: FontWeight.w600,
                     fontFamily: 'Poppins',
                     color: AppColors.mainColor,
                   ),
                 ),
                 onSelected: (selectedItems) {
                   if (selectedItems.isNotEmpty) {
                     final selected = selectedItems.first.data;
                     showCustomInput = false;
                     customBreed = null;
                     state.didChange(selected);
                     onChanged(selected);
                   }
                 },
               ),
             ).showModal(context);
           }

           final displayedText = showCustomInput
               ? (customBreed?.isNotEmpty == true
                     ? customBreed!
                     : AppStrings.enterBreedHint)
               : (state.value ?? AppStrings.choosePetBreed);

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               customLabel(AppStrings.petBreedLabel, state.context),
               SizedBox(height: 5.h),
               InkWell(
                 onTap: () => _showDropDown(state.context),
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
                       SvgPicture.asset(ImagesStrings.breedIcon),
                       SizedBox(width: 8.w),
                       Expanded(
                         child: Text(
                           displayedText,
                           style: Theme.of(state.context).textTheme.bodyMedium
                               ?.copyWith(
                                 color:
                                     (state.value == null && !showCustomInput)
                                     ? HelperFunctions.isDarkMode(state.context)
                                           ? Colors.white
                                           : AppColors.iconColor.withValues(
                                               alpha: 0.6,
                                             )
                                     : AppColors.iconColor.withValues(
                                         alpha: 0.6,
                                       ),
                                 fontSize: 14.sp,
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w400,
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
