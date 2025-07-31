import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class BirthdayAndColor extends StatelessWidget {
  const BirthdayAndColor({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Birthday
          Expanded(
            flex: 2,
            child: CustomTextField(
              title: AppStrings.birthdayLabel,
              hintText: AppStrings.birthdayHintText,
              readOnly: false,
              icon: Image.asset(ImagesStrings.petIcon),
              suffixIcon: GestureDetector(
                onTap: () => controller.chooseCalendarDate(context),
                child: const Icon(
                  Icons.calendar_today,
                  color: AppColors.buttonMainColor,
                ),
              ),
              controller: controller.birthdayController,
              currentFocusNode: controller.birthdayFocus,
              nextFocusNode: controller.colorFocus,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                String newValue = value;

                if (value.length == 4 && !value.contains('-')) {
                  newValue = '$value-';
                }

                if (value.length == 7 && value.split('-').length == 2) {
                  newValue = '$value-';
                }

                if (newValue != value) {
                  controller.birthdayController.value = TextEditingValue(
                    text: newValue,
                    selection: TextSelection.collapsed(offset: newValue.length),
                  );
                }

                if (newValue.length == 10) {
                  try {
                    final date = DateFormat('yyyy-MM-dd').parseStrict(newValue);
                    controller.emit(BirthdaySelected(date));
                  } catch (_) {}
                }
              },

              onEditingComplete: () {
                try {
                  final input = controller.birthdayController.text.trim();
                  final parsedDate = DateFormat(
                    'yyyy-MM-dd',
                  ).parseStrict(input);
                  final formatted = DateFormat('yyyy-MM-dd').format(parsedDate);
                  controller.birthdayController.text = formatted;
                  controller.emit(BirthdaySelected(parsedDate));
                } catch (_) {}
              },
            ),
          ),

          SizedBox(width: 9.w),

          // Color
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLabel(AppStrings.colorLabel, context),
                SizedBox(height: 5.h),
                DropdownButtonFormField(
                  value: context.read<CreatePetProfileCubit>().selectedColor,
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  icon: const Icon(
                    Iconsax.arrow_down_1,
                    size: 25,
                    color: AppColors.buttonMainColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  style: TextStyle(
                    // color:HelperFunctions.isDarkMode(context) ? Colors.white : AppColors.buttonMainColor,
                    fontSize: 16.sp,
                  ),
                  items: context.read<CreatePetProfileCubit>().colorOptions.map(
                    (color) {
                      return DropdownMenuItem(value: color, child: Text(color));
                    },
                  ).toList(),
                  onChanged: (value) {
                    context.read<CreatePetProfileCubit>().chooseColor(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    prefixIcon: Image.asset(ImagesStrings.colorIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade200,
                        width: 1.2.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.red.shade300,
                        width: 1.2.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
