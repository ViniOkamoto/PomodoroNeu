import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<String> getThemeKey();
  Future<void> setThemeKey(Brightness brightness);
}