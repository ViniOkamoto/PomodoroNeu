import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/domain/models/item.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  TextEditingController todoInputController = TextEditingController();
  @observable
  ObservableList<Item> todoList = ObservableList<Item>();

  @action
  addTodo() {
    todoList.add(
      Item(task: todoInputController.text),
    );
    todoInputController.text = "";
  }
  @action
  removeTodo(Item todo){
    todoList.remove(todo);
  }

  finishTodo(Item todo){
    print(todo.done);
    todo.done = todo.done ? false : true;
  }

}
