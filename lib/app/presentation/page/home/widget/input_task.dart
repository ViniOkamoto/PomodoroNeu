import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/store/todo/todo_store.dart';
import 'package:pomodoroapp/app/presentation/widget/app_button.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class InputTask extends StatelessWidget {
  final ThemeStore _themeStore = serviceLocator<ThemeStore>();
  final TodoStore _todoStore = serviceLocator<TodoStore>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: size.width * 0.019),
            width: size.width * 0.67,
            height: size.width * 0.13,
            decoration: primaryInnerShadow(
                bottomColor: themeStore.isDark ? whiteShadow30Dark : whiteShadow100Light,
                topColor: themeStore.isDark ? blackShadow30Dark : blackShadow25Light),
            child: TextField(
              controller: _todoStore.todoInputController,
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Adicionar nova tarefa",
                hintStyle: TextStyle(fontSize: size.width * 0.046),
                contentPadding: EdgeInsets.only(left: 15, bottom: 5, top: 11, right: 15),
              ),
            ),
          ),
          Observer(builder: (context) {
            return AppButton(
              isPressed: _todoStore.isPressedTodoButton,
              height: size.width * 0.12,
              width: size.width * 0.12,
              themeStore: _themeStore,
              icon: Icon(
                Icons.add,
                size: size.width * 0.09,
                color: orangeColor,
              ),
              onTap: () {
                _todoStore.setPressedTodoButton();
                _todoStore.addTodo();
              },
              size: size,
            );
          })
        ],
      ),
    );
  }
}
