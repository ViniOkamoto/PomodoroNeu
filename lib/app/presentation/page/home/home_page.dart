import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/circle_counter.dart';
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

  @override
  Widget build(BuildContext context) {
    var appBar = PomodoroAppBar(themeStore);
    themeStore = Provider.of<ThemeStore>(context);
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
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: appBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CounterPomodoro(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      AppBotom(
                        size: size,
                        themeStore: themeStore,
                        icon: Icons.play_arrow,
                        iconColor: greenColor,
                        iconSize: size.width * 0.10,
                        onTap: (){},
                      ),
                      AppBotom(
                        size: size,
                        themeStore: themeStore,
                        icon: Icons.stop,
                        iconColor: redDarkColor,
                        iconSize: size.width * 0.10,
                        onTap: (){},
                      ),
                      AppBotom(
                        size: size,
                        themeStore: themeStore,
                        icon: Icons.history,
                        iconColor: orangeColor,
                        iconSize: size.width * 0.10,
                        onTap: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBotom extends StatelessWidget {
  const AppBotom({
    Key key,
    @required this.onTap,
    @required this.size,
    @required this.themeStore,
    @required this.icon,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  final Size size;
  final ThemeStore themeStore;
  final Function onTap;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.15,
        height: size.width * 0.15,
        decoration: secondaryDropShadow(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          colorWidget: themeStore.isDark ? blackColor : whiteColor,
          topColor:
          themeStore.isDark ? whiteShadow30Dark : whiteShadow100Light,
          bottomColor:
          themeStore.isDark ? blackShadow30Dark : blackShadow10Light,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}

class CounterPomodoro extends StatefulWidget {
  @override
  _CounterPomodoroState createState() => _CounterPomodoroState();
}

class _CounterPomodoroState extends State<CounterPomodoro>
    with TickerProviderStateMixin {
  ThemeStore themeStore;
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
    themeStore = Provider.of<ThemeStore>(context);
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
            width: size.width,
            height: size.width,
            decoration: mainDropShadow(
                colorWidget: themeStore.isDark ? blackColor : whiteColor,
                bottomColor: themeStore.isDark
                    ? blackShadow30Dark
                    : blackShadow30Light,
                topColor: themeStore.isDark
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
                colorWidget: themeStore.isDark ? blackColor : whiteColor,
                bottomColor: themeStore.isDark
                    ? blackShadow30Dark
                    : blackShadow30Light,
                topColor: themeStore.isDark
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
                            color: themeStore.isDark
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
                        themeStore.isDark ? blackColor : whiteColor,
                        bottomColor: themeStore.isDark
                            ? blackShadow30Dark
                            : blackShadow10Light,
                        topColor: themeStore.isDark
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
