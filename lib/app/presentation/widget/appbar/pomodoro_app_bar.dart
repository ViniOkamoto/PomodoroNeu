import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/widget/appbar/header_app_bar.dart';
import 'package:pomodoroapp/app/presentation/widget/appbar/setting_button.dart';

class PomodoroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final themeStore;
  final height;
  PomodoroAppBar(this.themeStore, this.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23, left: 12, right: 12),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HeaderAppBar(),
            Observer(
              builder: (context) {
                return SettingButton(themeStore.isDark);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
