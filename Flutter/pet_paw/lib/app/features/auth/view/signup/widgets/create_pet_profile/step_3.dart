import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wizard_stepper/wizard_stepper.dart';

import '../../../../../../common/custom_dark_button.dart';
import '../../../../../../common/custom_text_field.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/images_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';
import '../../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import '../../../../controller/create_pet_profile/stepper_cubit.dart';
import '../../../pet_profile/widgets/selectable_options_row.dart';

class Step3 extends StatelessWidget with WizardStep {
  Step3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Form(
      key: controller.step2FormKey,
      child: Column(
        children: [
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),

          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),

          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          SizedBox(
            width: double.infinity,
            child: CustomDarkButton(
              text: AppStrings.finish,
              onPressed: () {
                if (controller.step2FormKey.currentState!.validate()) {
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
