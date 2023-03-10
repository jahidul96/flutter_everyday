import 'package:flutter/cupertino.dart';

class TodoAppProvider extends ChangeNotifier {
  List<String> todos = [];

  void addTodo(String text) {
    todos.add(text);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
