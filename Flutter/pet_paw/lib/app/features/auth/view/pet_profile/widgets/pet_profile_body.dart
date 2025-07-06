import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/auth/controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_profile_form.dart';

import 'upload_pet_image.dart';

class PetProfileBody extends StatelessWidget {
  const PetProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
              builder: (context, state) {
                if (state is ImageUploadedSuccessfully) {
                  return Container(
                    width: double.infinity,
                    height: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(state.imagePath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 325,
                      ),
                    ),
                  );
                } else if (state is ImageUploading) {
                  return const CircularProgressIndicator();
                } else {
                  return const UploadPetImage();
                }
              },
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            PetProfileForm(),
          ],
        ),
      ),
    );
  }
}
