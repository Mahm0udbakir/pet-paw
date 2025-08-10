import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/core/utils/constants/sizes.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/get_started/widgets/bottom_get_started.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/view/get_started/widgets/top_get_started.dart';

import '../../../../domain/app_language_cubit/change_language_cubit.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopGetStarted(),
                  SizedBox(height: Sizes.spaceBetweenSections * 2.h),
                  BottomGetStarted(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
