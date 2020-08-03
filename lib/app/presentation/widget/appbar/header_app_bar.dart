import 'package:flutter/material.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/fonts.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style:
          TextStyle(
              fontSize: mediumFontSize,
              color: orangeColor
          ),
        ),
      ],
    );
  }
}
