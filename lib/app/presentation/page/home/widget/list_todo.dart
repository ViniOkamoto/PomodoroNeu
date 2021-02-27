import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoroapp/app/domain/models/item.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/store/todo/todo_store.dart';
import 'package:pomodoroapp/core/di/service_locator.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class ListTodo extends StatefulWidget {
  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  final ThemeStore _themeStore = serviceLocator<ThemeStore>();
  final TodoStore _todoStore = serviceLocator<TodoStore>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (MediaQuery.of(context).size.height - 80) -
        MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: sizeHeight * 0.022),
      width: size.width * 0.81,
      height: size.height * 0.17,
      decoration: primaryInnerShadow(
        bottomColor:
            _themeStore.isDark ? whiteShadow30Dark : whiteShadow100Light,
        topColor: _themeStore.isDark ? blackShadow30Dark : blackShadow25Light,
        radius: 10,
      ),
      child: Observer(
        builder: (context) {
          return ReorderableListView(
            scrollDirection: Axis.vertical,
            children: _todoStore.todoList.map((e) {
              if (e == null) return Container();
              return Container(
                padding: EdgeInsets.only(
                    top: sizeHeight * 0.02,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                key: UniqueKey(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.reorder,
                            size: size.width * 0.06,
                            color: greyLightTextColor,
                          ),
                          GestureDetector(
                            onDoubleTap: () {
                              _todoStore.finishTodo(e);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.03),
                              child: Text(
                                e.task,
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: greyLightTextColor,
                                  decoration: e.done
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _todoStore.removeTodo(e);
                      },
                      child: Icon(
                        Icons.delete,
                        size: size.width * 0.06,
                        color: redAccentColor,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onReorder: (int oldIndex, int newIndex) {
              setState(
                () {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final Item newItem = _todoStore.todoList.removeAt(oldIndex);
                  _todoStore.todoList.insert(newIndex, newItem);
                },
              );
            },
          );
        },
      ),
    );
  }
}
