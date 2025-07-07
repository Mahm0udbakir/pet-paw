import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';

import '../../../../../common/custom_light_button.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/create_pet_profile/create_pet_profile_cubit.dart';
import '../../../controller/signup/signup_cubit.dart';
import '../../login/widgets/register_button.dart';
import '../create_pet_profile_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreatePetProfileCubit>();
    final signupCubit = context.read<SignupCubit>();
    final isLoading = controller.state is CreatePetProfileLoading;
    return Column(
      children: [
        CustomLightButton(
          text: 'add another pet',
          onPressed: () {
            controller.createPetProfile(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const CreatePetProfileScreen(isFirstTime: false),
              ),
            );
          },
        ),
        SizedBox(height: Sizes.spaceBetweenItems),
        RegisterButton(
          isLoading: isLoading,
          onPressed: () async {
            final signupSuccess = await signupCubit.signup();
            if (!signupSuccess) return;

            final profileCreated = await controller.createPetProfile(context);
            if (!profileCreated) return;

            if (context.mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.all(24),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 64,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'profile created successfully',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      const Text(
                        'your pet profile has been created successfully.',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('OK'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          buttonText: 'Create Profile',
          shimmerButtonText: 'Creating Profile...',
        ),
      ],
    );
  }
}
