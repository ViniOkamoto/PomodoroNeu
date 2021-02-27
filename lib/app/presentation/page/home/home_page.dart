import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/control_buttons.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/counter_pomodoro.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/input_task.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/list_todo.dart';
import 'package:pomodoroapp/app/presentation/store/home/home_store.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/appbar/pomodoro_app_bar.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeStore themeStore = serviceLocator<ThemeStore>();
  GlobalKey<ScaffoldState> _scaffoldKey;
  final HomeStore _homeStore = HomeStore();

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    var appBar = PomodoroAppBar(themeStore, sizeHeight * 0.15);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: appBar,
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.048, vertical: sizeHeight * 0.023),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CounterPomodoro(),
                  ControlButtons(),
                  InputTask(),
                  ListTodo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
