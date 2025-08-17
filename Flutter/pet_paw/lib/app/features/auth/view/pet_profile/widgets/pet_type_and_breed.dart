import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_drop_down_text_field.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/validators/validation.dart';
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
              validator: (value) => Validator.validatePetType(value),
              hintText: AppStrings.petTypeHint,
              title: AppStrings.petTypeTitle,
              items: cubit.petTypeOptions,
              prefixIcon: ImagesStrings.typeIcon,
              value: cubit.selectedType,
              onChanged: (value) {
                cubit.chooseType(value);
              },
            ),
            SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),

            BreedDropdown(
              validator: (value) => Validator.validatePetBreed(value),
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
