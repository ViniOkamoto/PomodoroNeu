import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/domain/models/item.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  final TextEditingController todoInputController = TextEditingController();

  @observable
  ObservableList<Item> todoList = ObservableList<Item>();

  @observable
  bool isPressedTodoButton = false;
  @action
  setPressedTodoButton() {
    isPressedTodoButton = true;
    Future.delayed(Duration(milliseconds: 100))
        .then((value) => isPressedTodoButton = false);
  }

  @action
  addTodo() {
    todoList.add(
      Item(task: todoInputController.text),
    );
    todoInputController.text = "";
  }

  @action
  removeTodo(Item todo) {
    todoList.remove(todo);
  }

  finishTodo(Item todo) {
    print(todo.done);
    todo.done = todo.done ? false : true;
  }
}
