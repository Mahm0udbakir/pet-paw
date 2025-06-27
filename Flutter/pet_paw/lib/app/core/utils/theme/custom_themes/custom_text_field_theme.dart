import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/sizes.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    labelStyle: const TextStyle().copyWith(fontSize: Sizes.mdFontSize, color: AppColors.textFormTextColor),
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.smFontSize, color: AppColors.textFormTextColor),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.textFormTextColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide:  const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    labelStyle: const TextStyle().copyWith(fontSize: Sizes.mdFontSize, color: AppColors.textFormTextColor),
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.smFontSize, color: AppColors.textFormTextColor),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.textFormTextColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide:  const BorderSide(width: 1, color: AppColors.textFormBorderColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );
}
