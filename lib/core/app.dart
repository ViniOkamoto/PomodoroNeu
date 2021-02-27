import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/router.dart';
import 'package:pomodoroapp/core/values/routes.dart';
import 'package:pomodoroapp/core/values/strings.dart';

class PomodoroApp extends StatelessWidget {
  final ThemeStore _themeStore = serviceLocator<ThemeStore>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Observer(
      builder: (_) {
        if (_themeStore.theme != null) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: APP_NAME,
            theme: _themeStore.theme,
            onGenerateRoute: Router.generateRoute,
            initialRoute: Routes.homePage,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
