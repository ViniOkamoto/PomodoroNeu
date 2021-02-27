import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class DropDown extends StatelessWidget {
  final double itemHeight;
  ThemeStore _themeStore = serviceLocator<ThemeStore>();
  DropDown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = _themeStore.isDark;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Container(
          height: 2 * this.itemHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isDark ? blackColor : whiteColor,
            boxShadow: [
              BoxShadow(
                  color: isDark ? whiteShadow30Dark : whiteShadow100Light,
                  offset: Offset(-1, -1),
                  blurRadius: 4),
              BoxShadow(
                  color: isDark ? blackShadow30Dark : blackShadow25Light,
                  offset: Offset(1, 1),
                  blurRadius: 4),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: _themeStore.switchLightTheme,
                  child: Icon(
                    Icons.brightness_high,
                    color: orangeColor,
                  ),
                ),
                GestureDetector(
                  onTap: _themeStore.switchDarkTheme,
                  child: Icon(
                    Icons.brightness_2,
                    color: orangeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
