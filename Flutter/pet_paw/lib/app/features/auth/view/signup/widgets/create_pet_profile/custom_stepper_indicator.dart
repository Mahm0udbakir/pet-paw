import 'package:flutter/material.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

class CustomStepperIndicator extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const CustomStepperIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  State<CustomStepperIndicator> createState() => _CustomStepperIndicatorState();
}

class _CustomStepperIndicatorState extends State<CustomStepperIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.totalSteps * 2 - 1, (index) {
        if (index.isEven) {
          int stepNumber = (index ~/ 2) + 1;
          bool isActive = stepNumber <= widget.currentStep;

          return AnimatedScale(
            scale: isActive ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: isActive
                  ? AppColors.mainColor
                  : AppColors.mainColor.withValues(alpha: 0.5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isActive
                        ? AppColors.mainColor
                        : AppColors.mainColor.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? AppColors.mainColor
                        : AppColors.mainColor.withValues(alpha: 0.5),
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '$stepNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          bool isLineActive = ((index ~/ 2) + 1) < widget.currentStep;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 35,
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            color: isLineActive
                ? AppColors.mainColor
                : AppColors.mainColor.withValues(alpha: 0.5),
          );
        }
      }),
    );
  }
}
