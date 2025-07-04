import 'package:flutter/material.dart';
import '../core/utils/constants/app_colors.dart';

class CustomLightButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomLightButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false, required child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 14,
          ),
          backgroundColor: AppColors.primaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: AppColors.buttonMainColor, width: 2),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(text, style: TextStyle(color: AppColors.buttonMainColor),),
      ),
    );
  }
}
