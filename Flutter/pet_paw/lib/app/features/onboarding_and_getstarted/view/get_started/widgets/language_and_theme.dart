import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/domain/app_language_cubit/change_language_cubit.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../domain/app_language_cubit/language_state.dart';
import '../../../../../domain/app_theme_cubit/apptheme_cubit.dart';
import '../../../../../domain/app_theme_cubit/theme_state.dart';

class LanguageAndTheme extends StatelessWidget {
  const LanguageAndTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<ChangeLanguageCubit>();
    final themeCubit = context.read<AppthemeCubit>();
    return Column(
      children: [
        GestureDetector(
          onTap: () => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
                builder: (context, state) {
                  final currentLang = (state is ChangeLanguageSuccess)
                      ? state.languageCode ?? 'en'
                      : 'en';
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.selectYourLanguage,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.buttonMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          title: const Text('English'),
                          trailing: currentLang == 'en'
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.buttonMainColor,
                                )
                              : null,
                          onTap: () {
                            if (currentLang != 'en') {
                              languageCubit.changeLanguage(LanguageState.en);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Language changed to English',
                                  ),
                                  backgroundColor: AppColors.buttonMainColor,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                    animation: const AlwaysStoppedAnimation(1.0),
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        ListTile(
                          title: const Text('العربية'),
                          trailing: currentLang == 'ar'
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.buttonMainColor,
                                )
                              : null,
                          onTap: () {
                            if (currentLang != 'ar') {
                              languageCubit.changeLanguage(LanguageState.ar);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'تم تغيير اللغة إلى العربية',
                                  ),
                                  backgroundColor: AppColors.buttonMainColor,
                                  behavior: SnackBarBehavior.floating,
                                  animation: const AlwaysStoppedAnimation(1.0),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                color: AppColors.buttonMainColor.withOpacity(0.4),
              ),
              SizedBox(width: 5.w),
              Text(
                AppStrings.changeLanguage,
                style: TextStyle(
                  color: AppColors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        BlocBuilder<AppthemeCubit, AppThemeState>(
          builder: (context, state) {
            final isDark = state is DarkAppTheme;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  color: isDark ? Colors.grey : AppColors.buttonMainColor,
                ),
                Switch(
                  value: isDark,
                  onChanged: (value) {
                    themeCubit.changeTheme(
                      value ? ThemeState.dark : ThemeState.light,
                    );
                  },
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.buttonMainColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.lightGray,
                ),
                Icon(
                  Icons.dark_mode_outlined,
                  color: isDark ? AppColors.buttonMainColor : Colors.grey,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
