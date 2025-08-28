import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class MedicalTextField extends StatelessWidget {
  const MedicalTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreatePetProfileCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(AppStrings.medicalConditionLabel, context),
        SizedBox(height: 5.h),
        TextFormField(
          controller: cubit.medicalController,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [LengthLimitingTextInputFormatter(500)],
          maxLines: 6,
          textInputAction: TextInputAction.done,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: HelperFunctions.isDarkMode(context)
                ? Colors.white
                : AppColors.iconColor.withValues(alpha: 0.6),
          ),
          decoration: InputDecoration(
            hint: Text(AppStrings.medicalConditionHint),
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : AppColors.iconColor.withValues(alpha: 0.6),
            ),
            alignLabelWithHint: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                ImagesStrings.medicalIcon,
                height: 20.h,
                width: 20.w,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            filled: true,
            fillColor: Color(0xff000000).withValues(alpha: 0.05),
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
              borderSide: BorderSide(color: Colors.transparent, width: 1.2.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent, width: 1.2.w),
            ),
          ),
        ),
      ],
    );
  }
}
