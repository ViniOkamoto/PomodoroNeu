import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/screens/home/home_page.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/datasource/theme_repository.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/service/theme_service.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/store/theme_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(
            create: (_) =>
            ThemeStore(ThemeService(ThemeRepository()))..getTheme())
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MobX Theme Switcher',
            theme: value.theme,
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
