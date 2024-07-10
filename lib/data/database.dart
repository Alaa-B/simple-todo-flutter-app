import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];

  final _todoBox = Hive.box('TODOBox');

  void createInitialList() {
    toDoList = [
      ['do math', false],
      ['complete execises', true]
    ];
  }

  void loadList() {
    toDoList = _todoBox.get('TODOBox');
  }

  void updateList() {
    _todoBox.put('TODOBox', toDoList);
  }
}
