import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/viewmodel/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_button.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class InputTask extends StatelessWidget {
  const InputTask({
    Key key,
    @required this.sizeHeight,
    @required this.size,
    @required this.themeStore,
  }) : super(key: key);

  final double sizeHeight;
  final Size size;
  final ThemeStore themeStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: size.width * 0.019),
            width: size.width * 0.67,
            height: size.width * 0.13,
            decoration: inputInnerShadow(
                bottomColor: themeStore.isDark
                    ? whiteShadow30Dark
                    : whiteShadow100Light,
                topColor: themeStore.isDark
                    ? blackShadow30Dark
                    : blackShadow10Light),
            child: TextField(
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Adicionar nova tarefa",
                hintStyle: TextStyle(
                    fontSize: size.width * 0.046
                ),
                contentPadding:
                EdgeInsets.only(left: 15, bottom: 0, top: 11, right: 15),
              ),
            ),
          ),
          AppButton(
            height: size.width * 0.12,
            width: size.width * 0.12,
            themeStore: themeStore,
            icon: Icons.add,
            iconColor: orangeColor,
            onTap: (){},
            size: size,
            iconSize: size.width * 0.09,
          )
        ],
      ),
    );
  }
}
