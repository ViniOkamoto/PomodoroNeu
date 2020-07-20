import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/presentation/page/home/widget/circle_counter.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_bar.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/drop_shadow.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeStore themeStore;
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<ReactionDisposer> _disposers;

  @override
  void initState(){
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    themeStore ??= Provider.of<ThemeStore>(context);
    _disposers ??= [
      reaction((fn) => themeStore.isDark, (isDark) {
        _scaffoldKey.currentState?.removeCurrentSnackBar();

        if (isDark) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Hello, Dark!"),
          ));
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Hello, Light!"),
          ));
        }
      })
    ];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: themeStore.toggleTheme,
          child: themeStore.isDark
              ? Icon(Icons.brightness_high)
              : Icon(Icons.brightness_2),
        ),
        appBar: MyCustomAppBar(themeStore),
        body: buildSplash(context),
      ),
    );
  }

  Widget buildSplash(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeStore.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Stack(
               alignment: AlignmentDirectional.center,
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                   width: MediaQuery.of(context).size.width * 0.89,
                   height: MediaQuery.of(context).size.height * 0.5,
                   decoration: dropShadow(
                       colorWidget: themeStore.isDark ? blackColor : whiteColor,
                       blackShadowColor: themeStore.isDark ? blackShadowDark : blackShadowLight,
                       whiteShadowColor: themeStore.isDark ? whiteShadowDark : whiteShadowLight
                   ),
                 ),
                 CustomPaint(
                   foregroundPainter: CircleCounter(),
                   child: Container(
                     height: MediaQuery.of(context).size.height * 0.5,
                     width: MediaQuery.of(context).size.width * 0.78,
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                   width: MediaQuery.of(context).size.width * 0.71,
                   height: MediaQuery.of(context).size.height * 0.5,
                   decoration: dropShadow(
                       colorWidget: blackColor,
                       blackShadowColor: themeStore.isDark ? blackShadowDark : blackShadowLight,
                       whiteShadowColor: themeStore.isDark ? whiteShadowDark : whiteShadowLight
                   ),
                 ),
               ],
             )
            ],
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }
}
