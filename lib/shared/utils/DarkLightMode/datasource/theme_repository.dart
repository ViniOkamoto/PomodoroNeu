import 'dart:ui';


import 'package:pomodoroapp/shared/utils/DarkLightMode/interface/i_theme_repository.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/theme_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository implements IThemeRepository {
  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(
      ThemeKey.Theme,
      brightness == Brightness.light ? "light" : "dark",
    );
  }

  @override
  Future<String> getThemeKey() async {
    return (await SharedPreferences.getInstance()).getString(ThemeKey.Theme);
  }
}