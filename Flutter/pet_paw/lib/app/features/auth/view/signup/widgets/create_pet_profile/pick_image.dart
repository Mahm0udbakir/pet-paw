import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/upload_pet_image.dart';

import '../../../../../../core/utils/constants/app_colors.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 296.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: Color(0xff2E201A).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44.w,
                decoration: BoxDecoration(
                  color: Color(0xff2E201A).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.rotate_right),
                      color: AppColors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.crop),
                      color: AppColors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
              Container(
                width: 44.w,
                decoration: BoxDecoration(
                  color: Color(0xff2E201A).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: AppColors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.insert_emoticon),
                      color: AppColors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(child: UploadPetImage()),
      ],
    );
  }
}
