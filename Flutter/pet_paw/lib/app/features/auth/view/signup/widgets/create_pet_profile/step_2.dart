import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:petpaw/app/common/custom_dark_button.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/core/utils/helpers/loaders.dart';
import 'package:petpaw/app/features/auth/controller/create_pet_profile/create_pet_profile_cubit.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/pet_type_and_breed.dart';
import 'package:petpaw/app/features/auth/view/pet_profile/widgets/weight_text_field.dart';
import 'package:wizard_stepper/wizard_stepper.dart';

import '../../../../../../common/custom_text_field.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/validators/validation.dart';
import '../../../../controller/create_pet_profile/stepper_cubit.dart';
import '../../../pet_profile/widgets/height_text_field.dart';
import '../../../pet_profile/widgets/selectable_options_row.dart';

class Step2 extends StatelessWidget with WizardStep {
  Step2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    return Form(
      key: controller.step2FormKey,
      child: Column(
        children: [
          CustomTextField(
            title: AppStrings.birthdayLabel,
            hintText: AppStrings.birthdayHintText,
            validator: (value) => Validator.validateBirthday(value),
            readOnly: false,
            icon: SvgPicture.asset(ImagesStrings.birthIcon),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => controller.chooseCalendarDate(context),
                child: SvgPicture.asset(ImagesStrings.calendarIcon),
              ),
            ),
            controller: controller.birthdayController,
            currentFocusNode: controller.birthdayFocus,
            nextFocusNode: controller.colorFocus,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
              LengthLimitingTextInputFormatter(10),
            ],
            onChanged: (value) {
              String newValue = value;

              if (value.length == 4 && !value.contains('-')) {
                newValue = '$value-';
              }

              if (value.length == 7 && value.split('-').length == 2) {
                newValue = '$value-';
              }

              if (newValue != value) {
                controller.birthdayController.value = TextEditingValue(
                  text: newValue,
                  selection: TextSelection.collapsed(offset: newValue.length),
                );
              }

              if (newValue.length == 10) {
                try {
                  final date = DateFormat('yyyy-MM-dd').parseStrict(newValue);
                  controller.emit(BirthdaySelected(date));
                } catch (_) {}
              }
            },

            onEditingComplete: () {
              try {
                final input = controller.birthdayController.text.trim();
                final parsedDate = DateFormat('yyyy-MM-dd').parseStrict(input);
                final formatted = DateFormat('yyyy-MM-dd').format(parsedDate);
                controller.birthdayController.text = formatted;
                controller.emit(BirthdaySelected(parsedDate));
              } catch (_) {}
            },
          ),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          WeightTextField(),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          HeightTextField(),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          BlocBuilder<CreatePetProfileCubit, CreatePetProfileState>(
            builder: (context, state) {
              return SelectableOptionsRow(
                options: [AppStrings.intactOption, AppStrings.neuteredOption],
                selectedValue: controller.neuterStatus,
                haveLabel: true,
                label: AppStrings.neuterStatusHint,
                validator: (value) => Validator.validateNeuterStatus(value),
                onSelect: (value) =>
                    controller.selectOption(group: 'neuter', value: value),
              );
            },
          ),
          SizedBox(height: Sizes.spaceBetweenInputFields * 2.h),
          SizedBox(
            width: double.infinity,
            child: CustomDarkButton(
              text: AppStrings.next,
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
