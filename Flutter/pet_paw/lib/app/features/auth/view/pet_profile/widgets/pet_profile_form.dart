import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/common/custom_text_field.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/validators/validation.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/bottom_buttons.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/medical_text_field.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/weight_text_field.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
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
                title: AppStrings.petNameLabel,
                hintText: AppStrings.petNameHint,
                icon: SvgPicture.asset(ImagesStrings.nameIcon),
                keyboardType: TextInputType.text,
                controller: controller.nameController,
                validator: (value) => Validator.validateName(value),
                currentFocusNode: controller.nameFocus,
                nextFocusNode: controller.birthdayFocus,
              ),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              BirthdayAndColor(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              WeightTextField(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              SelectableOptionsRow(
                options: [AppStrings.intactOption, AppStrings.neuteredOption],
                selectedValue: controller.neuterStatus,
                onSelect: (value) =>
                    controller.selectOption(group: 'neuter', value: value),
              ),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              // PetTypeAndBreed(),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),
              SelectableOptionsRow(
                options: [AppStrings.maleOption, AppStrings.femaleOption],
                selectedValue: controller.gender,
                haveLabel: true,
                label: AppStrings.genderLabel,
                onSelect: (value) =>
                    controller.selectOption(group: 'gender', value: value),
              ),
              SizedBox(height: Sizes.spaceBetweenInputFields.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.medicalConditionQuestion,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Checkbox(
                    value: context
                        .watch<CreatePetProfileCubit>()
                        .hasMedicalCondition,
                    onChanged: (val) {
                      context
                          .read<CreatePetProfileCubit>()
                          .toggleMedicalCondition(val ?? false);
                    },
                    activeColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
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
