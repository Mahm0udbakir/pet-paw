import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

void showPickImageBottomSheet(
  BuildContext context,
  CreatePetProfileCubit cubit,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Image',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Camera option
            _buildOptionTile(
              context,
              icon: Icons.camera_alt_rounded,
              color: Colors.blue,
              title: 'Take Photo',
              subtitle: 'Use your camera to take a new photo',
              onTap: () {
                cubit.pickImage(ImageSource.camera);
                Navigator.pop(context);
                cubit.uploadImage();
              },
            ),

            SizedBox(height: 12.h),
            Divider(height: 1.h),
            SizedBox(height: 12.h),

            // Gallery option
            _buildOptionTile(
              context,
              icon: Icons.photo_library_rounded,
              color: Colors.purple,
              title: 'Choose from Gallery',
              subtitle: 'Select an existing photo from your gallery',
              onTap: () {
                cubit.pickImage(ImageSource.gallery);
                Navigator.pop(context);
                cubit.uploadImage();
              },
            ),

            SizedBox(height: 16.h),
          ],
        ),
      );
    },
  );
}

Widget _buildOptionTile(
  BuildContext context, {
  required IconData icon,
  required Color color,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}
