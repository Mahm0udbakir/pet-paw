import 'package:bloc/bloc.dart';
import 'package:petpaw/app/core/utils/constants/constants.dart';

import 'language_state.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  Future<void> initialize() async {
    // prefs = await SharedPreferences.getInstance();
    // final savedLanguage = prefs.getString('language');
    // if (savedLanguage == 'en') {
    //   emit(ChangeLanguageSuccess(languageCode: 'en'));
    // } else if (savedLanguage == 'ar') {
    //   emit(ChangeLanguageSuccess(languageCode: 'ar'));
    // } else {
    //   emit(ChangeLanguageSuccess(languageCode: 'en'));
    // }
    final savedLanguage = Constants.prefs.getString('language');
    final language = savedLanguage;
    emit(ChangeLanguageSuccess(languageCode: language));
  }

  void changeLanguage(LanguageState languageState) async {
    if (Constants.prefs.containsKey('language')) {
      await initialize();
    }
    switch (languageState) {
      case LanguageState.initial:
        initialize();
        break;
      case LanguageState.en:
        Constants.prefs.setString('language', 'en');
        emit(ChangeLanguageSuccess(languageCode: 'en'));
        break;
      case LanguageState.ar:
        Constants.prefs.setString('language', 'ar');
        emit(ChangeLanguageSuccess(languageCode: 'ar'));
        break;
    }
  }
}
