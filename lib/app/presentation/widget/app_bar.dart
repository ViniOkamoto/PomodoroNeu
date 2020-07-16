import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/widget/setting_button.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/fonts.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final themeStore;
  MyCustomAppBar(this.themeStore);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeStore.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Padding(
        padding: EdgeInsets.only(top: 23, left: 12, right: 12 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Okamoto",
                  style: TextStyle(
                  fontSize: smallFontSize,
                  color: greySecondaryColor
                  ),
                ),
                Text(
                  "Pomodoro",
                  style: TextStyle(
                      fontSize: mediumFontSize,
                      color: orangeColor
                  ),
                ),
              ],
            ),
            Observer(
              builder: (context){
                return SettingButton(themeStore.isDark);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  @override  Size get preferredSize => Size.fromHeight(80);
}
