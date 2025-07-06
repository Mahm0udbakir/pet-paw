import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/custom_light_button.dart';
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
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CreatePetProfileScreen(isFirstTime: false),
            ),
          ),
        ),
        SizedBox(height: Sizes.spaceBetweenItems),
        RegisterButton(
          isLoading: isLoading,
          onPressed: () => controller.createPetProfile(),
          buttonText: 'Create Profile',
          shimmerButtonText: 'Creating Profile...',
        ),
      ],
    );
  }
}
