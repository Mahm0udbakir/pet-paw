import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petpaw/app/splash_screen.dart';

import 'app/core/utils/theme/theme.dart';
import 'app/domain/app_language_cubit/change_language_cubit.dart';
import 'app/domain/app_theme_cubit/apptheme_cubit.dart';
import 'app/localization/generated/l10n.dart';

class PetPaw extends StatelessWidget {
  const PetPaw({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = ChangeLanguageCubit();
            cubit.initialize();
            return cubit;
          },
        ),
        BlocProvider(create: (context) => AppthemeCubit()..init()),
      ],
      child: BlocBuilder<AppthemeCubit, AppThemeState>(
        builder: (context, themeState) {
          final theme = (themeState is DarkAppTheme)
              ? AppTheme.darkTheme
              : AppTheme.lightTheme;
          return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, langState) {
              final locale =
                  (langState is ChangeLanguageSuccess &&
                      langState.languageCode != null)
                  ? Locale(langState.languageCode!)
                  : const Locale('en');
              return MaterialApp(
                key: ValueKey(locale.languageCode),
                debugShowCheckedModeBanner: false,
                title: 'PetPaw',
                theme: theme,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,

                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
