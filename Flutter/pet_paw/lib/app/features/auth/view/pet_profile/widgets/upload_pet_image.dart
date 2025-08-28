import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        padding: EdgeInsets.all(12),
        width: 180.w,
        height: 180.h,
        decoration: BoxDecoration(
          color: Color(0xff000000).withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Stack(
            children: [
              SvgPicture.asset(
                ImagesStrings.uploadPetImage,
                color: Colors.grey,
                width: 154.w,
                height: 125.h,
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Icon(Icons.add, color: AppColors.white, size: 54.sp),
                    SizedBox(height: Sizes.spaceBetweenItems.h),
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        AppStrings.uploadYourPetImage,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
