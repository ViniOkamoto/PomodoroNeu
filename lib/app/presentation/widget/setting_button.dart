import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class SettingButton extends StatefulWidget {
  final themeStore;
  SettingButton(this.themeStore);
  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){

        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  this.widget.themeStore.isDark ? blackColor : whiteColor,
              boxShadow: [
                BoxShadow(
                    color: this.widget.themeStore.isDark ? whiteShadowDark : whiteShadowLight,
                    offset: Offset(-1, -1),
                    blurRadius: 2
                ),
                BoxShadow(
                    color: this.widget.themeStore.isDark ? blackShadowDark : blackShadowLight,
                    offset: Offset(1, 1),
                    blurRadius: 4
                ),
              ]
          ),
          child: Icon(Icons.settings, size: 30, color: orangeColor,),
        ),
      );
  }
}
