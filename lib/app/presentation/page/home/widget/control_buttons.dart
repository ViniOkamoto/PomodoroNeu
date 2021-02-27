import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/store/counter/counter_pomodoro_store.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_button.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class ControlButtons extends StatefulWidget {
  const ControlButtons({
    Key key,
  }) : super(key: key);

  @override
  _ControlButtonsState createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  final CounterPomodoroStore _store = serviceLocator<CounterPomodoroStore>();
  final ThemeStore _themeStore = serviceLocator<ThemeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.048,
          right: size.width * 0.048,
          top: sizeHeight * 0.032),
      child: Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AppButton(
              isPressed: _store.isPressedPlayButton,
              height: size.width * 0.15,
              width: size.width * 0.15,
              size: size,
              themeStore: _themeStore,
              icon: Icon(
                _store.isPressedPlayButton ? Icons.pause : Icons.play_arrow,
                color: _store.isPressedPlayButton ? redColor : greenColor,
                size: size.width * 0.10,
              ),
              onTap: () {
                _store.setPressedPlayButton();
              },
            ),
            AppButton(
              isPressed: _store.isPressedStopButton,
              height: size.width * 0.15,
              width: size.width * 0.15,
              size: size,
              themeStore: _themeStore,
              icon: Icon(
                Icons.stop,
                size: size.width * 0.10,
                color: redDarkColor,
              ),
              onTap: () {
                _store.setPressedStopButton();
              },
            ),
            AppButton(
              isPressed: _store.isPressedLoopingButton,
              height: size.width * 0.15,
              width: size.width * 0.15,
              size: size,
              themeStore: _themeStore,
              icon: Icon(
                Icons.history,
                size: size.width * 0.10,
                color: orangeColor,
              ),
              onTap: () {
                _store.setPressedLoopingButton();
              },
            ),
          ],
        );
      }),
    );
  }
}
