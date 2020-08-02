import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/circle_counter.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_bar.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ThemeStore themeStore;
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<ReactionDisposer> _disposers;
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    themeStore = Provider.of<ThemeStore>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MyCustomAppBar(themeStore),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      width: 500,
                      height: 500,
                      decoration: mainDropShadow(
                          colorWidget:
                              themeStore.isDark ? blackColor : whiteColor,
                          bottomColor: themeStore.isDark
                              ? blackShadow30Dark
                              : blackShadow40Light,
                          topColor: themeStore.isDark
                              ? whiteShadow30Dark
                              : whiteShadow100Light),
                    ),
                    Container(
                      width: 330,
                      height: 330,
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
                      width: 315,
                      height: 315,
                      decoration: mainDropShadow(
                          colorWidget:
                              themeStore.isDark ? blackColor : whiteColor,
                          bottomColor: themeStore.isDark
                              ? blackShadow30Dark
                              : blackShadow40Light,
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
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "00:05:00",
                                    style: TextStyle(
                                        fontSize: 28, color: redAccentColor),
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
                                  colorWidget: themeStore.isDark
                                      ? blackColor
                                      : whiteColor,
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
                                          color: greyLightTextColor,
                                          fontSize: 15),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeStore.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: mainDropShadow(
                        colorWidget:
                            themeStore.isDark ? blackColor : whiteColor,
                        bottomColor: themeStore.isDark
                            ? blackShadow30Dark
                            : blackShadow10Light,
                        topColor: themeStore.isDark
                            ? whiteShadow30Dark
                            : whiteShadow100Light),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4518,
                    width: MediaQuery.of(context).size.width * 0.75,
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
                    width: MediaQuery.of(context).size.width * 0.72,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: mainDropShadow(
                        colorWidget: blackColor,
                        bottomColor: themeStore.isDark
                            ? blackShadow30Dark
                            : blackShadow10Light,
                        topColor: themeStore.isDark
                            ? whiteShadow30Dark
                            : whiteShadow100Light),
                  ),
                ],
              ),
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
