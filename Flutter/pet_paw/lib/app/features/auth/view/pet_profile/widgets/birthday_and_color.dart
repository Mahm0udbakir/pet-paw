import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/common/custom_text_field.dart';

import '../../../../../core/utils/constants/app_colors.dart';
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
              title: 'Birthday',
              hintText: '',
              readOnly: true,
              icon: Image.asset(ImagesStrings.petIcon),
              suffixIcon: InkWell(
                onTap: () => controller.chooseCalendarDate(context),
                child: const Icon(
                  Icons.calendar_today,
                  color: AppColors.buttonMainColor,
                ),
              ),
              controller: controller.birthdayController,
            ),
          ),
          const SizedBox(width: 10),

          // Color
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLabel('Color', context),
                SizedBox(height: 5),
                DropdownButtonFormField(
                  value: context.read<CreatePetProfileCubit>().selectedColor,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  icon: const Icon(
                    Iconsax.arrow_down_1,
                    size: 25,
                    color: AppColors.buttonMainColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  style: const TextStyle(
                    color: AppColors.buttonMainColor,
                    fontSize: 16,
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
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    prefixIcon: Image.asset(ImagesStrings.colorIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade200,
                        width: 1.2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.red.shade300,
                        width: 1.2,
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
