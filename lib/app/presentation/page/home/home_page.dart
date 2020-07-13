import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_bar.dart';
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Foodie",
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "The best way to track your nutrition.",
              style: TextStyle(fontSize: 16),
            ),
          ],
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
