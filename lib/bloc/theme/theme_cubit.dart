import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/common/theme/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(AutoThemeState(appThemeData[AppTheme.Auto]));
  void autoTheme(){
    emit(AutoThemeState(appThemeData[AppTheme.Auto]));
  }

  void lightTheme(){
    emit(LightThemeState(appThemeData[AppTheme.Light]));
  }
  void darkTheme(){
    emit(DarkThemeState(appThemeData[AppTheme.Dark]));
  }
}
