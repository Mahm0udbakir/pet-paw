import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class HeightTextField extends StatelessWidget {
  const HeightTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(AppStrings.heightLabel, context),
        SizedBox(height: 8.h),
        BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
          buildWhen: (previous, current) => current is HeightUpdated,
          builder: (context, state) {
            return TextFormField(
              validator: (value) => Validator.validateHeight(value),
              keyboardType: TextInputType.number,
              controller: controller.heightController,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: HelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : AppColors.iconColor.withValues(alpha: 0.6),
              ),
              onFieldSubmitted: (value) =>
                  controller.validateHeightInput(context, value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff000000).withValues(alpha: 0.05),

                hintText: AppStrings.enterPetHeightHint,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: HelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : AppColors.iconColor.withValues(alpha: 0.6),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(ImagesStrings.heightIcon),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => controller.incrementWeight(),
                        child: SvgPicture.asset(
                          ImagesStrings.upIcon,
                          height: 8.h,
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.decrementWeight(),
                        child: SvgPicture.asset(
                          ImagesStrings.downIcon,
                          height: 8.h,
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
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.2.w,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 1.2.w,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.transparent,
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
