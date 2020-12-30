import 'package:bloc_rest_api/common/theme/theme_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as : ThemePreference)
class ThemeRepositoryImpl extends ThemePreference{

  @override
  Future<String> getTheme() async{
    var preference = await SharedPreferences.getInstance();
    return preference.getString(ThemePreference.key) ?? "";
  }

  @override
  Future<void> saveTheme(String theme) async{
    var preference = await SharedPreferences.getInstance();
    preference.setString(ThemePreference.key, theme);
  }

  @override
  Future<void> autoTheme() async{
    var preference = await SharedPreferences.getInstance();
    preference.setString(ThemePreference.key, "");
  }

}