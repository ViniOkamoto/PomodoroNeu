import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/utils/theme_data.dart';

class ThemeUseCase {
  ThemeRepository _themeRepository = serviceLocator<ThemeRepository>();

  Future<ThemeData> getTheme() async {
    final String themeKey = await _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme.brightness);
      return lightTheme;
    }
    return themeKey == "light" ? lightTheme : darkTheme;
  }

  Future<ThemeData> toggleTheme(ThemeData theme, isDark) async {
    theme = isDark ? darkTheme : lightTheme;
    await _themeRepository.setThemeKey(theme.brightness);
    return theme;
  }
}
