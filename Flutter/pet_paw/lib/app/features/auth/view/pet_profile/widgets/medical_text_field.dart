import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/common/custom_label.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/images_strings.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';

class MedicalTextField extends StatelessWidget {
  const MedicalTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel('Medical conditions/Special needs', context),
        const SizedBox(height: 5),
        TextFormField(
          controller: context.read<CreatePetProfileCubit>().medicalController,
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [LengthLimitingTextInputFormatter(500)],
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Enter any medical conditions or special needs",
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.iconColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            alignLabelWithHint: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 8.0),
              child: Image.asset(
                ImagesStrings.medicalIcon,
                height: 20,
                width: 20,
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.brown.shade200, width: 1.2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
