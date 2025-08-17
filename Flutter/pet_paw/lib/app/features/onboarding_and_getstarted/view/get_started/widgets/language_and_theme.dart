import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/domain/app_language_cubit/change_language_cubit.dart';

import '../../../../../common/custom_dark_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../domain/app_language_cubit/language_state.dart';
import '../../../../../domain/app_theme_cubit/apptheme_cubit.dart';
import '../../../../../domain/app_theme_cubit/theme_state.dart';

class LanguageAndTheme extends StatelessWidget {
  const LanguageAndTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
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
                  String currentLang = (state is ChangeLanguageSuccess)
                      ? state.languageCode ?? 'en'
                      : 'en';
                  String tempSelectedLang = currentLang;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                'English',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22.sp,
                                  color: tempSelectedLang == 'en'
                                      ? AppColors.mainColor
                                      : AppColors.iconColor.withValues(
                                          alpha: 0.5,
                                        ),
                                  fontWeight: tempSelectedLang == 'en'
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),

                              onTap: () =>
                                  setState(() => tempSelectedLang = 'en'),
                            ),
                            ListTile(
                              title: Text(
                                'العربية',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 22.sp,
                                  color: tempSelectedLang == 'ar'
                                      ? AppColors.mainColor
                                      : AppColors.iconColor.withValues(
                                          alpha: 0.5,
                                        ),
                                  fontWeight: tempSelectedLang == 'ar'
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),

                              onTap: () =>
                                  setState(() => tempSelectedLang = 'ar'),
                            ),
                            SizedBox(height: Sizes.xl - 2.h),
                            SizedBox(
                              width: double.infinity,
                              child: CustomDarkButton(
                                text: AppStrings.selectYourLanguage,
                                onPressed: () {
                                  if (tempSelectedLang != currentLang) {
                                    languageCubit.changeLanguage(
                                      tempSelectedLang == 'ar'
                                          ? LanguageState.ar
                                          : LanguageState.en,
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          tempSelectedLang == 'ar'
                                              ? 'تم تغيير اللغة إلى العربية'
                                              : 'Language changed to English',
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        duration: const Duration(seconds: 2),
                                        animation: const AlwaysStoppedAnimation(
                                          1.0,
                                        ),
                                      ),
                                    );
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                color: isDark
                    ? Colors.grey
                    : AppColors.iconColor.withValues(alpha: 0.5),
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.changeLanguage,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: isDark ? Color(0xffBDBDBD) : AppColors.gray,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? Color(0xffBDBDBD) : AppColors.gray,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        BlocBuilder<AppthemeCubit, AppThemeState>(
          builder: (context, state) {
            final isDark = state is DarkAppTheme;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  color: isDark ? AppColors.grey : AppColors.mainColor,
                  size: 24.sp,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.elasticOut,
                    );

                    return ScaleTransition(
                      scale: curvedAnimation,
                      child: child,
                    );
                  },
                  child: Switch(
                    key: ValueKey(isDark),
                    value: isDark,
                    onChanged: (value) {
                      themeCubit.changeTheme(
                        value ? ThemeState.dark : ThemeState.light,
                      );
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.mainColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: AppColors.lightGray,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 0,
                  ),
                ),
                Icon(
                  Icons.dark_mode_outlined,
                  color: isDark
                      ? AppColors.mainColor
                      : AppColors.iconColor.withValues(alpha: 0.5),
                  size: 24.sp,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
