import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'show_pick_image_bottom_sheet.dart';

class UploadPetImage extends StatelessWidget {
  const UploadPetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = context.read<CreatePetProfileCubit>();
        showPickImageBottomSheet(context, controller);
      },
      child: Container(
        width: double.infinity,
        height: 275.h,
        decoration: BoxDecoration(
          color: Color(0xffD8CEB0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagesStrings.uploadPetImage),
            SizedBox(height: Sizes.spaceBetweenItems.h),
            Text(
              AppStrings.uploadYourPetImage,
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
