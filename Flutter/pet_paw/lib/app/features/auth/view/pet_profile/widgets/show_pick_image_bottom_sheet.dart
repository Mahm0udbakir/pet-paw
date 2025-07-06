import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

void showPickImageBottomSheet(
  BuildContext context,
  CreatePetProfileCubit cubit,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('select from camera'),
              onTap: () {
                cubit.pickImage(ImageSource.camera);
                Navigator.pop(context);
                cubit.uploadImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('select from gallery'),
              onTap: () {
                cubit.pickImage(ImageSource.gallery);
                Navigator.pop(context);
                cubit.uploadImage();
              },
            ),
          ],
        ),
      );
    },
  );
}
