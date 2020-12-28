part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}
class AutoThemeState extends ThemeState {
  final ThemeData themeData;

  AutoThemeState(this.themeData);
  @override
  List<Object> get props => [themeData];
}
class LightThemeState extends ThemeState {
  final ThemeData themeData;

  LightThemeState(this.themeData);
  @override
  List<Object> get props => [themeData];
}
class  DarkThemeState extends ThemeState{
  final ThemeData themeData;

  DarkThemeState(this.themeData);

  @override

  List<Object> get props => [themeData];

}

