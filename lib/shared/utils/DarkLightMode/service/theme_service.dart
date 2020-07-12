import 'package:flutter/material.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/interface/i_theme_repository.dart';
import 'package:pomodoroapp/shared/utils/constants.dart';

class ThemeService {
  ThemeService(IThemeRepository themeRepository)
      : _themeRepository = themeRepository;

  IThemeRepository _themeRepository;

  ThemeData get lightTheme => ThemeData(
    primarySwatch: orangeColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    visualDensity: VisualDensity.comfortable,
  );

  ThemeData get darkTheme => ThemeData(
    primarySwatch: orangeColor,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.comfortable,
  );
  Future<ThemeData> getTheme() async {
    final String themeKey = await _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme.brightness);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  Future<ThemeData> toggleTheme(ThemeData theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await _themeRepository.setThemeKey(theme.brightness);
    return theme;
  }
}