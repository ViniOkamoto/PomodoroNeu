import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/domain/usecases/theme_usecase.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  ThemeUseCase _themeUseCase = serviceLocator<ThemeUseCase>();

  _ThemeStore() {
    getTheme();
  }
  @computed
  bool get isDark => theme.brightness == Brightness.dark;

  @observable
  ThemeData theme;

  @action
  Future<void> getTheme() async {
    theme = await _themeUseCase.getTheme();
  }

  @action
  Future<void> switchLightTheme() async {
    theme = await _themeUseCase.toggleTheme(theme, false);
  }

  @action
  Future<void> switchDarkTheme() async {
    theme = await _themeUseCase.toggleTheme(theme, true);
  }
}
