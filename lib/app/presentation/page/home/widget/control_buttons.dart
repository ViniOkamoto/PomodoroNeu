import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_button.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    Key key,
    @required this.size,
    @required this.sizeHeight,
    @required this.themeStore,
  }) : super(key: key);

  final Size size;
  final double sizeHeight;
  final ThemeStore themeStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.048, right: size.width * 0.048, top: sizeHeight * 0.032),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AppButton(
            height: size.width * 0.15,
            width: size.width * 0.15,
            size: size,
            themeStore: themeStore,
            icon: Icons.play_arrow,
            iconColor: greenColor,
            iconSize: size.width * 0.10,
            onTap: (){},
          ),
          AppButton(
            height: size.width * 0.15,
            width: size.width * 0.15,
            size: size,
            themeStore: themeStore,
            icon: Icons.stop,
            iconColor: redDarkColor,
            iconSize: size.width * 0.10,
            onTap: (){},
          ),
          AppButton(
            height: size.width * 0.15,
            width: size.width * 0.15,
            size: size,
            themeStore: themeStore,
            icon: Icons.history,
            iconColor: orangeColor,
            iconSize: size.width * 0.10,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}