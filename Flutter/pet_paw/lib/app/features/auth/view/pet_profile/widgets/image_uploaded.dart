// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'show_pick_image_bottom_sheet.dart';

class ImageUploaded extends StatelessWidget {
  const ImageUploaded({super.key, required this.imageFile});

  final XFile imageFile;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePetProfileCubit>();
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 275.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(imageFile.path),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 275.h,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showPickImageBottomSheet(context, cubit);
              },
              child: Row(
                children: [
                  Tooltip(
                    message: 'Edit image',
                    child: Icon(
                      Iconsax.edit,
                      color: AppColors.success,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Change the pet image',
                    style: TextStyle(
                      color: AppColors.success,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                cubit.clearImage();
              },
              child: Row(
                children: [
                  Tooltip(
                    message: 'Delete image',
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: AppColors.error,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// void showImageOptionsBottomSheet(
//   BuildContext context,
//   CreatePetProfileCubit cubit,
// ) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (_) {
//       return Wrap(
//         children: [
//           ListTile(
//             leading: Icon(Icons.visibility),
//             title: Text('View Image'),
//             onTap: () {
//               Navigator.pop(context);
//               showDialog(
//                 context: context,
//                 builder: (_) =>
//                     Dialog(child: Image.file(File(cubit.imageFile!.path))),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.edit),
//             title: Text('Update Image'),
//             onTap: () {
//               Navigator.pop(context);
//               showPickImageBottomSheet(context, cubit);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.delete),
//             title: Text('Delete Image'),
//             onTap: () {
//               Navigator.pop(context);
//               cubit.imageFile = null;
//               cubit.emit(ImagePickCancelled());
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
