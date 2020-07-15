import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoroapp/app/presentation/widget/concave_decoration.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class SettingButton extends StatefulWidget {
  final isDark;
  SettingButton(this.isDark);
  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {

    final dropShadow = BoxDecoration(
        shape: BoxShape.circle,
        color: this.widget.isDark ? blackColor : whiteColor,
        boxShadow: [
          BoxShadow(
              color: this.widget.isDark ? whiteShadowDark : whiteShadowLight,
              offset: Offset(-1, -1),
              blurRadius: 2
          ),
          BoxShadow(
              color: this.widget.isDark ? blackShadowDark : blackShadowLight,
              offset: Offset(1, 1),
              blurRadius: 4
          ),
        ]
    );
    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      colors: [this.widget.isDark ? whiteShadowDark : whiteShadowLight, this.widget.isDark ? blackShadowDark : blackShadowLight],
      depth: 7,
      opacity: 0.3
    );
      return GestureDetector(
          onTap: (){
            setState(() {
             _isPressed =  _isPressed ? false : true;
            });
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: _isPressed ? innerShadow : dropShadow,
            child: Icon(Icons.settings, size: 30, color: orangeColor,),
          ),
        );
  }
}
