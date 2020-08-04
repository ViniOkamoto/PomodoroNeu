import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/circle_counter.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class CounterPomodoro extends StatefulWidget {
  final ThemeStore themeStore;
  CounterPomodoro({@required this.themeStore});
  @override
  _CounterPomodoroState createState() => _CounterPomodoroState();
}

class _CounterPomodoroState extends State<CounterPomodoro>
    with TickerProviderStateMixin {

  List<ReactionDisposer> _disposers;
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
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
    var size = MediaQuery
        .of(context)
        .size;
    var sizeHeight =
        (MediaQuery
            .of(context)
            .size
            .height - 80) - MediaQuery
            .of(context)
            .padding
            .top;
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            width: size.width * 0.9,
            height: size.width * 0.9,
            decoration: mainDropShadow(
                colorWidget: this.widget.themeStore.isDark ? blackColor : whiteColor,
                bottomColor: this.widget.themeStore.isDark
                    ? blackShadow30Dark
                    : blackShadow30Light,
                topColor: this.widget.themeStore.isDark
                    ? whiteShadow30Dark
                    : whiteShadow100Light),
          ),
          Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
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
            width: size.width * 0.76,
            height: size.width * 0.76,
            decoration: mainDropShadow(
                colorWidget: this.widget.themeStore.isDark ? blackColor : whiteColor,
                bottomColor: this.widget.themeStore.isDark
                    ? blackShadow30Dark
                    : blackShadow30Light,
                topColor: this.widget.themeStore.isDark
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
                            color: this.widget.themeStore.isDark
                                ? darkTextCounterGreyColor
                                : lightTextCounterGreyColor,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "00:05:00",
                          style:
                          TextStyle(fontSize: 28, color: redAccentColor),
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
                    width: 150,
                    height: 50,
                    decoration: tertiaryDropShadow(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        colorWidget:
                        this.widget.themeStore.isDark ? blackColor : whiteColor,
                        bottomColor: this.widget.themeStore.isDark
                            ? blackShadow30Dark
                            : blackShadow10Light,
                        topColor: this.widget.themeStore.isDark
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }
}
