import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/common/theme/app_theme.dart';
import 'package:bloc_rest_api/common/theme/theme_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final ThemePreference _themePreference;
  ThemeCubit(this._themePreference) : super(AutoThemeState(appThemeData[AppTheme.Auto])){
     _loadTheme();
  }
  void autoTheme(){
    emit(AutoThemeState(appThemeData[AppTheme.Auto]));
  }

  void lightTheme() async{
    await _themePreference.saveTheme(ThemePreference.light);
    emit(LightThemeState(appThemeData[AppTheme.Light]));
  }
  void darkTheme() async{
    await _themePreference.saveTheme(ThemePreference.dark);
    emit(DarkThemeState(appThemeData[AppTheme.Dark]));
  }
  void _loadTheme(){
    _themePreference.getTheme().then((theme) {
      if(theme == ThemePreference.light){
        lightTheme();
      }
      else if(theme == ThemePreference.dark){
        darkTheme();
      }
      else
        autoTheme();
    });
  }
}
