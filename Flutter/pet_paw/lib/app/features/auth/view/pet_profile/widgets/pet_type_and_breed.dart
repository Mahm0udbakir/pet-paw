import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_drop_down_text_field.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'breed_dropdown.dart';

class PetTypeAndBreed extends StatelessWidget {
  const PetTypeAndBreed({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePetProfileCubit>();

    return BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            // Pet Type Dropdown
            CustomDropDownTextField(
              hintText: AppStrings.petTypeHint,
              title: AppStrings.petTypeTitle,
              items: cubit.petTypeOptions,
              value: cubit.selectedType,
              // controller: cubit.petTypeDropdownController,
              onChanged: (value) {
                cubit.chooseType(value);
              },
            ),
            SizedBox(height: Sizes.spaceBetweenInputFields.h),

            BreedDropdown(
              key: ValueKey('breed_${cubit.selectedType}'),
              options: cubit.breedOptions,
              selectedBreed: cubit.selectedBreed,
              onChanged: cubit.chooseBreed,
            ),
          ],
        );
      },
    );
  }
}
