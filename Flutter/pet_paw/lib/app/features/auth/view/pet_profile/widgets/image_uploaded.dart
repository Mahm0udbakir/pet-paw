// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'show_pick_image_bottom_sheet.dart';

class ImageUploaded extends StatelessWidget {
  const ImageUploaded({
    super.key,
    required this.imageFile,
    required this.onTap,
  });

  final XFile imageFile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 325,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            File(imageFile.path),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 325,
          ),
        ),
      ),
    );
  }
}

void showImageOptionsBottomSheet(
  BuildContext context,
  CreatePetProfileCubit cubit,
) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text('View Image'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) =>
                    Dialog(child: Image.file(File(cubit.imageFile!.path))),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Update Image'),
            onTap: () {
              Navigator.pop(context);
              showPickImageBottomSheet(context, cubit);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Image'),
            onTap: () {
              Navigator.pop(context);
              cubit.imageFile = null;
              cubit.emit(ImagePickCancelled());
            },
          ),
        ],
      );
    },
  );
}
