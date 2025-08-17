import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_profile_body.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class CreatePetProfileScreen extends StatelessWidget {
  const CreatePetProfileScreen({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          isFirstTime
              ? AppStrings.createPetProfileTitle
              : AppStrings.addAnotherPetTitle,
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => CreatePetProfileCubit(),
        child: PetProfileBody(),
      ),
    );
  }
}
