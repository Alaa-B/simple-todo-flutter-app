import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];

  final _todoBox = Hive.box('TODOBox');

  void createInitialList() {
    toDoList = [
      ['todo example', false],
    ];
  }

  void loadList() {
    toDoList = _todoBox.get('TODOBox');
  }

  void updateList() {
    _todoBox.put('TODOBox', toDoList);
  }
}
