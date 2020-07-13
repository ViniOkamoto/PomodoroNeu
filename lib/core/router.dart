import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/page/home/home_page.dart';
import 'package:pomodoroapp/core/values/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Nenhuma rota definida para ${settings.name}.'),
            ),
          ),
        );
    }
  }
}