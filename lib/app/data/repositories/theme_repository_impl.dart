import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/data/datasource/local/theme_datasource.dart';
import 'package:pomodoroapp/app/data/datasource/local/theme_datasource.dart';
import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  IThemeDatasource _service = serviceLocator<IThemeDatasource>();

  @override
  Future<String> getThemeKey() async {
    return await _service.getThemeKey();
  }

  @override
  Future<void> setThemeKey(Brightness brightness) async {
    return await _service.setThemeKey(brightness);
  }
}