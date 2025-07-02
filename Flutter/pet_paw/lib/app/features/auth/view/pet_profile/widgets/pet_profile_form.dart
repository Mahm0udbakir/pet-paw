import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/weight_text_field.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'birthday_and_color.dart';
import 'option.dart';

class PetProfileForm extends StatelessWidget {
  const PetProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              title: 'Pet\'s name',
              hintText: 'Enter your pet\'s name',
              icon: Image.asset(ImagesStrings.petIcon),
              keyboardType: TextInputType.text,
              controller: controller.nameController,
              validator: (value) => Validator.validateName(value),
            ),
            SizedBox(height: Sizes.spaceBetweenInputFields),
            BirthdayAndColor(),
            SizedBox(height: Sizes.spaceBetweenInputFields),
            WeightTextField(),
            SizedBox(height: Sizes.spaceBetweenInputFields),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: buildOption('Intact', context)),
                  Expanded(child: buildOption('Neutered', context)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
