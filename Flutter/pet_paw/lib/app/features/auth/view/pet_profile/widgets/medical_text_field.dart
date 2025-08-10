import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_label.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class MedicalTextField extends StatelessWidget {
  const MedicalTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreatePetProfileCubit>();

    if (!cubit.hasMedicalCondition) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(AppStrings.medicalConditionLabel, context),
        SizedBox(height: 5.h),
        TextFormField(
          controller: cubit.medicalController,
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [LengthLimitingTextInputFormatter(500)],
          maxLines: 10,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: AppStrings.medicalConditionHint,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.iconColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
            alignLabelWithHint: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 8.0),
              child: SvgPicture.asset(
                ImagesStrings.medicalIcon,
                height: 20.h,
                width: 20.w,
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: Colors.brown.shade200,
                width: 1.2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2.w),
            ),
          ),
        ),
      ],
    );
  }
}
