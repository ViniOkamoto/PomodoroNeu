import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoroapp/app/domain/models/item.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/control_buttons.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/counter_pomodoro.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/input_task.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/appbar/pomodoro_app_bar.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeStore themeStore;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  List<Item> b = [
    Item(done: false, task: "comer pudim"),
    Item(done: false, task: "fazer paçoca"),
    Item(done: false, task: "fazer sei lá"),
    Item(done: false, task: "fazer paçoca"),
    Item(done: false, task: "fazer isso aqui"),
    Item(done: false, task: "fazer isso aqui"),
    Item(done: false, task: "fazer isso aqui"),
    Item(done: false, task: "fazer isso aqui"),
  ];

  @override
  Widget build(BuildContext context) {
    themeStore = Provider.of<ThemeStore>(context);
    var appBar = PomodoroAppBar(themeStore);
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.048, vertical: sizeHeight * 0.023),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CounterPomodoro(
              themeStore: themeStore,
            ),
            ControlButtons(
              size: size,
              sizeHeight: sizeHeight,
              themeStore: themeStore,
            ),
            InputTask(
                sizeHeight: sizeHeight, size: size, themeStore: themeStore),
            Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.032),
              width: size.width * 0.81,
              height: size.height * 0.17,
              decoration: listInnerShadow(
                  bottomColor: themeStore.isDark
                      ? whiteShadow30Dark
                      : whiteShadow100Light,
                  topColor: themeStore.isDark
                      ? blackShadow30Dark
                      : blackShadow10Light),
              child: ReorderableListView(
                scrollDirection: Axis.vertical,
                children: b.map((e) {
                  return ListTile(
                    key: UniqueKey(),
                    title: Text(e.task),
                  );
                }).toList(),
                onReorder: (int oldIndex, int newIndex) {
                  setState(
                    () {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                        final Item newItem = b.removeAt(oldIndex);
                        b.insert(newIndex, newItem);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
