import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class ThemeUseCase {
  ThemeRepository _themeRepository = serviceLocator<ThemeRepository>();

//  ThemeData get lightTheme => ThemeData(
//    primarySwatch: Colors.teal,
//    accentColor: Colors.deepPurpleAccent,
//    brightness: Brightness.light,
//    scaffoldBackgroundColor: Color(0xFFecf0f1),
//  );
//
//  ThemeData get darkTheme => ThemeData(
//    primarySwatch: Colors.teal,
//    accentColor: Colors.tealAccent,
//    brightness: Brightness.dark,
//  );
  ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    visualDensity: VisualDensity.comfortable,
  );

  ThemeData get darkTheme => ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor,
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