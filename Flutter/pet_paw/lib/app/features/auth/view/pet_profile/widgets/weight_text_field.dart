import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class WeightTextField extends StatelessWidget {
  const WeightTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel('Weight (Kg.)', context),
        SizedBox(height: 5.h),
        BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
          buildWhen: (previous, current) => current is WeightUpdated,
          builder: (context, state) {
            return TextFormField(
              readOnly: false,
              keyboardType: TextInputType.number,
              controller: controller.weightController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your pet's weight (kg.)",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.iconColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(ImagesStrings.weightIcon),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => controller.incrementWeight(),
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 25,
                          color: AppColors.buttonMainColor,
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.decrementWeight(),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                          color: AppColors.buttonMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
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
            );
          },
        ),
      ],
    );
  }
}
