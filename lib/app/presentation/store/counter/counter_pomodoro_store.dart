import 'dart:async';

import 'package:mobx/mobx.dart';

part 'counter_pomodoro_store.g.dart';

class CounterPomodoroStore = _CounterPomodoroStore with _$CounterPomodoroStore;

abstract class _CounterPomodoroStore with Store {
  Timer _timer;

  @observable
  String durationMilisecondsCounter;

  _startTimer() {}

  @observable
  bool isPressedPlayButton = false;
  @action
  setPressedPlayButton() {
    isPressedPlayButton = isPressedPlayButton ? false : true;
  }

  @observable
  bool isPressedStopButton = false;
  @action
  setPressedStopButton() {
    isPressedStopButton = true;
    Future.delayed(Duration(milliseconds: 100))
        .then((value) => isPressedStopButton = false);
  }

  @observable
  bool isPressedLoopingButton = false;
  @action
  setPressedLoopingButton() {
    isPressedLoopingButton = isPressedLoopingButton ? false : true;
  }

  @observable
  bool isPressedConfigTimerButton = false;
  @action
  setPressedConfigTimerButton() {
    isPressedLoopingButton = isPressedLoopingButton ? false : true;
  }
}
