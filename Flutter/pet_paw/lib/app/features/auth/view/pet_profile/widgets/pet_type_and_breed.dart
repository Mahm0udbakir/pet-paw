import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/custom_drop_down_text_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class PetTypeAndBreed extends StatelessWidget {
  const PetTypeAndBreed({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePetProfileCubit>();
    return BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomDropDownTextField(
              hintText: 'Choose your pet',
              title: 'Pet Type',
              items: cubit.petTypeOptions,
              value: cubit.selectedType,
              onChanged: (value) => cubit.chooseType(value),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields),
            CustomDropDownTextField(
              hintText: 'Choose your pet breed',
              title: 'Breed',
              items: cubit.selectedType == null ? [] : cubit.breedOptions,
              value: cubit.selectedBreed,
              onChanged: cubit.selectedType == null
                  ? null
                  : (value) => cubit.chooseBreed(value),
            ),
          ],
        );
      },
    );
  }
}
