import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key key,
    @required this.onTap,
    @required this.size,
    @required this.themeStore,
    @required this.icon,
    this.width,
    this.height,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  final Size size;
  final ThemeStore themeStore;
  final Function onTap;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: secondaryDropShadow(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          colorWidget: themeStore.isDark ? blackColor : whiteColor,
          topColor:
          themeStore.isDark ? whiteShadow30Dark : whiteShadow100Light,
          bottomColor:
          themeStore.isDark ? blackShadow30Dark : blackShadow10Light,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}