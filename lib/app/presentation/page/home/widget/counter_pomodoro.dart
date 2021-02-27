import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/circle_counter.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class CounterPomodoro extends StatefulWidget {
  @override
  _CounterPomodoroState createState() => _CounterPomodoroState();
}

class _CounterPomodoroState extends State<CounterPomodoro>
    with TickerProviderStateMixin {
  final ThemeStore _themeStore = serviceLocator<ThemeStore>();
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            width: size.width * 0.83,
            height: size.width * 0.83,
            decoration: mainDropShadow(
                colorWidget: _themeStore.isDark ? blackColor : whiteColor,
                bottomColor:
                    _themeStore.isDark ? blackShadow30Dark : blackShadow30Light,
                topColor: _themeStore.isDark
                    ? whiteShadow30Dark
                    : whiteShadow100Light),
          ),
          Container(
            width: size.width * 0.83,
            height: size.width * 0.83,
            decoration: mainDropShadow(
                colorWidget: _themeStore.isDark ? blackColor : whiteColor,
                bottomColor:
                    _themeStore.isDark ? blackShadow30Dark : blackShadow30Light,
                topColor: _themeStore.isDark
                    ? whiteShadow30Dark
                    : whiteShadow100Light),
          ),
          Container(
            width: size.width * 0.733,
            height: size.width * 0.733,
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return CustomPaint(
                  painter: CircleCounter(
                    animation: controller,
                    backgroundColor: greySecondaryColor,
                    color: orangeColor,
                  ),
                );
              },
            ),
          ),
          Container(
            width: size.width * 0.703,
            height: size.width * 0.703,
            decoration: mainDropShadow(
                colorWidget: _themeStore.isDark ? blackColor : whiteColor,
                bottomColor:
                    _themeStore.isDark ? blackShadow30Dark : blackShadow30Light,
                topColor: _themeStore.isDark
                    ? whiteShadow30Dark
                    : whiteShadow100Light),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "00:30:00",
                        style: TextStyle(
                            fontSize: 40,
                            color: _themeStore.isDark
                                ? darkTextCounterGreyColor
                                : lightTextCounterGreyColor,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "00:05:00",
                          style: TextStyle(fontSize: 28, color: redAccentColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.only(left: 8),
                    width: size.width * 0.4,
                    height: size.width * 0.12,
                    decoration: tertiaryDropShadow(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        colorWidget:
                            _themeStore.isDark ? blackColor : whiteColor,
                        bottomColor: _themeStore.isDark
                            ? blackShadow30Dark
                            : blackShadow25Light,
                        topColor: _themeStore.isDark
                            ? whiteShadow30Dark
                            : whiteShadow100Light),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: orangeColor,
                          size: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Configurar",
                            style: TextStyle(
                                color: greyLightTextColor, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
