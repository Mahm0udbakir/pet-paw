import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/auth/controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_profile_form.dart';

import '../../../../../core/utils/helpers/loaders.dart';
import 'image_uploaded.dart';
import 'upload_pet_image.dart';

class PetProfileBody extends StatelessWidget {
  const PetProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePetProfileCubit, CreatePetProfileState>(
      listener: (context, state) {
        if (state is ImagePickFailed) {
          Loaders.errorSnackBar(
            context: context,
            title: 'Image Selection Failed',
            message: state.error,
          );
        }

        if (state is ImageUploadFailed) {
          Loaders.errorSnackBar(
            context: context,
            title: 'Image Upload Failed',
            message: state.error,
          );
        }

        if (state is ProfileCreationFailed) {
          Loaders.errorSnackBar(
            context: context,
            title: 'Profile Creation Failed',
            message: state.error,
          );
        }

        if (state is ValidationFailed) {
          Loaders.warningSnackBar(
            context: context,
            title: 'Validation Error',
            message: state.message,
          );
        }

        if (state is ImageUploadedSuccessfully) {
          Loaders.successSnackBar(
            context: context,
            title: 'Image Uploaded',
            message: 'Your pet image was uploaded successfully.',
          );
        }

        if (state is ProfileCreatedSuccessfully) {
          Loaders.successSnackBar(
            context: context,
            title: 'Profile Created',
            message: 'Your pet profile has been created.',
          );

          // Navigator.pushReplacement(...);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
                buildWhen: (previous, current) =>
                    current is ImageUploadedSuccessfully ||
                    current is ImageUploading ||
                    current is ImagePickFailed ||
                    current is ImagePickCancelled,
                builder: (context, state) {
                  final cubit = context.read<CreatePetProfileCubit>();
                  final imageFile = cubit.imageFile;

                  if (state is ImageUploading) {
                    return const CircularProgressIndicator();
                  }

                  if (imageFile != null) {
                    return ImageUploaded(imageFile: imageFile);
                  } else {
                    return const UploadPetImage();
                  }
                },
              ),
              SizedBox(height: Sizes.spaceBetweenItems.h),
              PetProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
