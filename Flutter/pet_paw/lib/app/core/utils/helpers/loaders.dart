import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/app_colors.dart';
import '../helpers/helper_functions.dart';

class Loaders {
  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void customToast({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.greyColor.withOpacity(0.9)
                : AppColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: AppColors.success,
      icon: const Icon(Iconsax.check, color: AppColors.white),
      duration: duration,
    );
  }

  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.orange,
      icon: const Icon(Iconsax.warning_2, color: AppColors.white),
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.red.shade600,
      icon: const Icon(Iconsax.warning_2, color: AppColors.white),
    );
  }

  static void _showStyledSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor,
    required Icon icon,
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duration),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        content: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  if (message.isNotEmpty)
                    Text(message, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
