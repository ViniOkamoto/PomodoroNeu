import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key key,
    @required this.onTap,
    @required this.size,
    @required this.themeStore,
    @required this.icon,
    this.isPressed = false,
    this.width,
    this.height,
  }) : super(key: key);

  final Size size;
  final ThemeStore themeStore;
  final Function onTap;
  final Widget icon;
  final width;
  final height;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: isPressed
              ? secundaryInnerShadow(
                  bottomColor: themeStore.isDark
                      ? whiteShadow30Dark
                      : whiteShadow100Light,
                  topColor: themeStore.isDark
                      ? blackShadow30Dark
                      : blackShadow25Light,
                  radius: 10.0)
              : secondaryDropShadow(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  colorWidget: themeStore.isDark ? blackColor : whiteColor,
                  topColor: themeStore.isDark
                      ? whiteShadow30Dark
                      : whiteShadow100Light,
                  bottomColor: themeStore.isDark
                      ? blackShadow30Dark
                      : blackShadow25Light,
                ),
          child: icon),
    );
  }
}
