import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/auth/controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_type_and_breed.dart';
import 'package:wizard_stepper/wizard_stepper.dart';

import '../../../../../../common/custom_text_field.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/validators/validation.dart';
import '../../../../controller/create_pet_profile/stepper_cubit.dart';
import '../../../pet_profile/widgets/selectable_options_row.dart';

class Step1 extends StatelessWidget with WizardStep {
  Step1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Form(
      key: controller.step1FormKey,
      child: Column(
        children: [
          CustomTextField(
            title: AppStrings.nameFieldTitle,
            hintText: AppStrings.petNameHint,
            icon: SvgPicture.asset(ImagesStrings.nameIcon),
            keyboardType: TextInputType.text,
            controller: controller.nameController,
            validator: (value) => Validator.validateName(value),
            currentFocusNode: FocusNode(),
          ),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          PetTypeAndBreed(),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
            builder: (context, state) {
              return SelectableOptionsRow(
                options: [AppStrings.maleOption, AppStrings.femaleOption],
                selectedValue: controller.gender,
                validator: (value) => Validator.validateGender(value),
                haveLabel: true,
                label: AppStrings.petGenderHint,
                onSelect: (value) =>
                    controller.selectOption(group: 'gender', value: value),
              );
            },
          ),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          SizedBox(
            width: double.infinity,
            child: CustomDarkButton(
              text: AppStrings.next,
              onPressed: () {
                if (controller.step1FormKey.currentState!.validate()) {
                  context.read<StepperCubit>().nextStep();
                }
                /*else {
                  Loaders.errorSnackBar(
                    context: context,
                    title: AppStrings.fillAllFields,
                    message: AppStrings.fillAllFields,
                  );
                }*/
              },
            ),
          ),
        ],
      ),
    );
  }
}
