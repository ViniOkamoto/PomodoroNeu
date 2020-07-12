import 'package:flutter/material.dart';
import 'package:pomodoroapp/shared/components/setting_button.dart';
import 'package:pomodoroapp/shared/utils/constants.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                fontSize: size3Font,
                color: grey2Color
                ),
              ),
              Text(
                "Pomodoro",
                style: TextStyle(
                    fontSize: size2Font,
                    color: orangeColor
                ),
              ),
            ],
          ),
          SettingButton()
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  @override  Size get preferredSize => Size.fromHeight(80);
}
