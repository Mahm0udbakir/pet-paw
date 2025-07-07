import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/bottom_buttons.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/medical_text_field.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/weight_text_field.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'birthday_and_color.dart';
import 'pet_type_and_breed.dart';
import 'selectable_options_row.dart';

class PetProfileForm extends StatelessWidget {
  const PetProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Form(
      key: controller.formKey,
      child: BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
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
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              BirthdayAndColor(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              WeightTextField(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              SelectableOptionsRow(
                options: ['Intact', 'Neutered'],
                selectedValue: controller.neuterStatus,
                onSelect: (value) =>
                    controller.selectOption(group: 'neuter', value: value),
              ),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              PetTypeAndBreed(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              SelectableOptionsRow(
                options: ['Male', 'Female'],
                selectedValue: controller.gender,
                haveLabel: true,
                label: 'Gender',
                onSelect: (value) =>
                    controller.selectOption(group: 'gender', value: value),
              ),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              MedicalTextField(),
              SizedBox(height: Sizes.spaceBetweenItems.h),
              BottomButtons(),
            ],
          );
        },
      ),
    );
  }
}
