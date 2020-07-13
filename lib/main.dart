import 'package:flutter/material.dart';
import 'package:pomodoroapp/core/app.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(PomodoroApp());
}
