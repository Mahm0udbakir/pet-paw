import 'package:flutter/material.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';

import '../../../../../core/utils/constants/sizes.dart';

class UploadPetImage extends StatelessWidget {
  const UploadPetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xffD8CEB0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesStrings.uploadPetImage),
            SizedBox(height: Sizes.spaceBetweenItems),
            Text(
              'Upload your pet image',
              style: TextStyle(
                color: AppColors.buttonMainColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
