import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petpaw/app/common/custom_label.dart';

import '../core/utils/constants/app_colors.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    required this.hintText,
    required this.value,
  });

  final List<String> items;
  final void Function(String?)? onChanged;
  final String title;
  final String hintText;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel(title, context),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: items.isEmpty ? null : value,
          itemHeight: 50,
          menuMaxHeight: 250,
          items: items.isEmpty
              ? []
              : items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Text(
                            item,
                            style: TextStyle(color: AppColors.buttonMainColor),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          onChanged: items.isEmpty ? null : onChanged,
          disabledHint: Text(
            items.isEmpty
                ? 'Choose $title after selecting type'
                : 'Select $title',
            style: TextStyle(color: Colors.brown.shade200),
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(
            Iconsax.arrow_down_1,
            size: 25,
            color: AppColors.buttonMainColor,
          ),
          hint: Text(hintText, style: TextStyle(color: Colors.brown.shade200)),

          padding: const EdgeInsets.symmetric(horizontal: 12),
          style: const TextStyle(
            color: AppColors.buttonMainColor,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.brown.shade200, width: 1.2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
