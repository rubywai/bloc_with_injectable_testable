import 'package:shared_preferences/shared_preferences.dart';


abstract class ThemePreference{
  static const key = "key";
  static const light = 'light';
  static const dark = 'dark';
  Future<void> saveTheme(String theme);
  Future<void> autoTheme();
  Future<String> getTheme();
}