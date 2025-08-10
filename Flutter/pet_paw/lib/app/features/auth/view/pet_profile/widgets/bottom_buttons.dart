import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';

import '../../../../../common/custom_light_button.dart';
import '../../../../../common/done_screen.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import '../../login/widgets/register_button.dart';
import '../create_pet_profile_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    final isLoading = controller.state is CreatePetProfileLoading;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomLightButton(
            text: AppStrings.addAnotherPet,
            onPressed: () async {
              final created = await controller.createPetProfile(context);
              if (!created) return;

              controller.resetForm();

              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CreatePetProfileScreen(isFirstTime: false),
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(height: Sizes.spaceBetweenItems.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              backgroundColor: AppColors.buttonMainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () async {
              final profileCreatedFuture = controller.createPetProfile(context);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonMainColor,
                      ),
                    ),
                  );
                },
              );

              final profileCreated = await profileCreatedFuture;

              Navigator.of(context).pop();

              if (!profileCreated) return;

              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoneScreen(
                      message: AppStrings.welcomeMessage,
                      imageAsset: ImagesStrings.successCharacter,
                      description: AppStrings.welcomeDescription,
                      buttonText: AppStrings.loginButtonText,
                      nextScreen: BlocProvider(
                        create: (context) => LoginCubit(),
                        child: LoginScreen(),
                      ),
                    ),
                  ),
                  (route) => false,
                );
              }
            },
            child: Text(AppStrings.createProfile),
          ),
        ),
      ],
    );
  }
}
