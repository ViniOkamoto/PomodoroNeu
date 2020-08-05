import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/core/router.dart';
import 'package:pomodoroapp/core/values/routes.dart';
import 'package:pomodoroapp/core/values/strings.dart';
import 'package:provider/provider.dart';

class PomodoroApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(
            create: (_) =>
            ThemeStore()..getTheme())
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) {
            if(value.theme != null){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: APP_NAME,
              theme: value.theme,
              onGenerateRoute: Router.generateRoute,
              initialRoute: Routes.homePage,
            );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
