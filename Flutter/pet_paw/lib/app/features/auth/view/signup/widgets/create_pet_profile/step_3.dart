import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/medical_text_field.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/create_pet_profile/finish_dialog.dart';
import 'package:petpaw/app/features/auth/view/signup/widgets/create_pet_profile/pick_image.dart';
import 'package:wizard_stepper/wizard_stepper.dart';

import '../../../../../../common/custom_dark_button.dart';
import '../../../../../../common/custom_text_field.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/images_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';
import '../../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import '../../../../controller/create_pet_profile/stepper_cubit.dart';

class Step3 extends StatelessWidget with WizardStep {
  Step3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Form(
      key: controller.step2FormKey,
      child: Column(
        children: [
          PickImage(),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          CustomTextField(
            title: AppStrings.petCharacteristicTitle,
            hintText: AppStrings.petCharacteristicHint,
            icon: SvgPicture.asset(ImagesStrings.characteristicIcon),
            controller: controller.characteristicController,
            currentFocusNode: controller.characteristicFocus,
            minLines: 2,
            maxLines: 4,
            validator: (value) => Validator.validateCharacteristic(value),
          ),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          MedicalTextField(),

          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          SizedBox(
            width: double.infinity,
            child: CustomDarkButton(
              text: AppStrings.finish,
              onPressed: () {
                if (controller.step2FormKey.currentState!.validate()) {
                  Navigator.of(context).pop();

                  // افتح الـ dialog الجديد
                  showDialog(
                    context: context,
                    builder: (context) {
                      return FinishDialog();
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
