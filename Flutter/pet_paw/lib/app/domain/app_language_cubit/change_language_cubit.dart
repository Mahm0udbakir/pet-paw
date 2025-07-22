import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petpaw/app/core/utils/constants/constants.dart';

import '../../localization/generated/l10n.dart';
import 'language_state.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  Future<void> initialize() async {
    final savedLanguage = Constants.prefs.getString('language') ?? 'en';
    emit(ChangeLanguageSuccess(languageCode: savedLanguage));
  }

  void changeLanguage(LanguageState languageState) async {
    String code = 'en';

    switch (languageState) {
      case LanguageState.initial:
        await initialize();
        return;
      case LanguageState.en:
        code = 'en';
        break;
      case LanguageState.ar:
        code = 'ar';
        break;
    }
    await Constants.prefs.setString('language', code);

    await S.load(Locale(code));

    emit(ChangeLanguageSuccess(languageCode: code));
  }
}
