import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';

import '../../../../../common/custom_light_button.dart';
import '../../../../../common/done_screen.dart';
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
        CustomLightButton(
          text: 'add another pet',
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
        SizedBox(height: Sizes.spaceBetweenItems.h),
        RegisterButton(
          isLoading: isLoading,
          onPressed: () async {
            final profileCreated = await controller.createPetProfile(context);
            if (!profileCreated) return;

            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneScreen(
                    message: "Welcome to PetPaw",
                    imageAsset: ImagesStrings.successCharacter,
                    description: "You are one of our family!",
                    buttonText: "Login",
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
          buttonText: 'Create Profile',
          shimmerButtonText: 'Creating Profile...',
        ),
      ],
    );
  }
}
