import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/shared/components/app_bar.dart';
import 'package:pomodoroapp/shared/utils/DarkLightMode/store/theme_store.dart';
import 'package:pomodoroapp/shared/utils/constants.dart';
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
  var themeData = Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.black);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: themeStore.toggleTheme,
          child: themeStore.isDark
              ? Icon(Icons.brightness_high)
              : Icon(Icons.brightness_2),
        ),
        appBar: MyCustomAppBar(),
        backgroundColor: whiteColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: themeStore.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          child: Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }
}
