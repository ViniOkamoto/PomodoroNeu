import 'package:flutter/material.dart';
import 'package:pomodoroapp/core/values/colors.dart';

ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    visualDensity: VisualDensity.comfortable,
    fontFamily: "Maven Pro");

ThemeData get darkTheme => ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: blackColor,
      visualDensity: VisualDensity.comfortable,
      fontFamily: "Maven Pro",
    );
