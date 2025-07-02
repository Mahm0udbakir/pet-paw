import 'package:flutter/material.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_profile_body.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class CreatePetProfileScreen extends StatelessWidget {
  const CreatePetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        title: const Text(
          'Create Pet Profile',
          style: TextStyle(
            color: AppColors.buttonMainColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Icon(Icons.arrow_back_ios, color: AppColors.buttonMainColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PetProfileBody(),
    );
  }
}
