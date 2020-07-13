import 'dart:ui';


import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/core/values/theme_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IThemeDatasource{
  Future<void> setThemeKey(Brightness brightness);
  Future<String> getThemeKey();
}

class ThemeDatasource implements IThemeDatasource{
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