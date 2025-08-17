import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import '../../../../controller/create_pet_profile/stepper_cubit.dart';
import 'custom_stepper_indicator.dart';
import 'step_1.dart';
import 'step_2.dart';
import 'step_3.dart';

class CoreDialog extends StatelessWidget {
  const CoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(flex: 3),

        // Provider for pet profile data
        BlocProvider(
          create: (context) => CreatePetProfileCubit(),
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: MediaQuery.of(context).size.height * 0.85,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<StepperCubit, int>(
                  builder: (context, currentStep) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Top navigation row
                          Row(
                            children: [
                              if (currentStep > 1)
                                IconButton(
                                  onPressed: () {
                                    context.read<StepperCubit>().previousStep();
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              const Spacer(),
                              CustomStepperIndicator(
                                currentStep: currentStep,
                                totalSteps: 3,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),

                          SizedBox(height: 40.h),

                          // Animated content between steps
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              final offsetAnimation = Tween<Offset>(
                                begin: context.read<StepperCubit>().isForward
                                    ? const Offset(
                                        0.1,
                                        0,
                                      ) // Next → slide from right
                                    : const Offset(
                                        -0.1,
                                        0,
                                      ), // Back → slide from left
                                end: Offset.zero,
                              ).animate(animation);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            },
                            child: _buildStepWidget(currentStep),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        // Bottom description box
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            color: const Color(0xff000000).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "After submitting your pet information we will help you to find the best products, mates, shelters, centers and other service for it.",
            style: TextStyle(color: Colors.white, fontSize: 12.sp, height: 1.3),
            textAlign: TextAlign.center,
          ),
        ),

        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildStepWidget(int currentStep) {
    switch (currentStep) {
      case 1:
        return Step1(key: const ValueKey(1));
      case 2:
        return Step2(key: const ValueKey(2));
      case 3:
        return Step3(key: const ValueKey(3));
      default:
        return const SizedBox.shrink();
    }
  }
}
