import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petpaw/app/common/custom_text_field.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/images_strings.dart';

class BirthdayAndColor extends StatelessWidget {
  const BirthdayAndColor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Birthday Container
          Expanded(
            child: CustomTextField(
              title: 'Birthday',
              hintText: '',
              readOnly: true,
              icon: Image.asset(ImagesStrings.petIcon),
              suffixIcon: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.calendar_today,
                  color: AppColors.buttonMainColor,
                ),
              ),
              controller: TextEditingController(),
            ),
          ),
          const SizedBox(width: 16),

          // Color Container
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  icon: const Icon(
                    Iconsax.arrow_down_1,
                    size: 25,
                    color: AppColors.buttonMainColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  style: const TextStyle(
                    color: AppColors.buttonMainColor,
                    fontSize: 16,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: '1',
                      child: Text(
                        '1',
                        style: TextStyle(color: AppColors.buttonMainColor),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text(
                        '2',
                        style: TextStyle(color: AppColors.buttonMainColor),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    prefixIcon: Image.asset(ImagesStrings.colorIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade100,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown.shade200,
                        width: 1.2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.red.shade300,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
