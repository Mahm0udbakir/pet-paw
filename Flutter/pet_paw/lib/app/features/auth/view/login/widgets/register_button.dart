import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.buttonText,
    required this.shimmerButtonText,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final String buttonText;
  final String shimmerButtonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          backgroundColor: AppColors.buttonMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.white.withOpacity(0.6),
                highlightColor: Colors.white,
                child: Text(
                  shimmerButtonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
