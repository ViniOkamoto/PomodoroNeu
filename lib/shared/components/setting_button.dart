import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoroapp/shared/utils/constants.dart';

class SettingButton extends StatefulWidget {
  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> with TickerProviderStateMixin {
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
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: whiteShadow,
                  offset: Offset(-1, -1),
                  blurRadius: 50
              ),
              BoxShadow(
                  color: blackShadow,
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
