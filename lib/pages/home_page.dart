import 'package:flutter/material.dart';
import '../data/database.dart';
import '../util/todotile.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../util/dialogbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box('TODOBox');
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_todoBox.get('TODOBox') == null) {
      db.createInitialList();
    } else {
      db.loadList();
    }
  }

  ToDoDatabase db = ToDoDatabase();

  void onChange(bool? value, int itemIndex) {
    setState(() {
      db.toDoList[itemIndex][1] = !db.toDoList[itemIndex][1];
    });
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              textControlller: _controller,
              onSave: onSave,
              onCancel: Navigator.of(context).pop,
            ));
  }

  void onSave() {
    setState(() {
      _controller.toString().isNotEmpty
          ? db.toDoList.add([_controller.text, false])
          : null;
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateList();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('ToDo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, itemIndex) {
          return Todotile(
            toDoCheck: db.toDoList[itemIndex][1],
            toDoText: db.toDoList[itemIndex][0],
            onChanged: (value) => onChange(value, itemIndex),
            deleteTask: (context) => deleteTask(itemIndex),
          );
        },
      ),
    );
  }
}
