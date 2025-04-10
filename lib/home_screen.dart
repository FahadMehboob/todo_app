import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/todo_database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    if (_myBox.get("TODOLSIT") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  final TextEditingController _controller = TextEditingController();

  final _myBox = Hive.box("myBox");

  TodoDatabase db = TodoDatabase();

  //Method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoTasks[index][1] = !db.todoTasks[index][1];
    });
    db.updateDatabase();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  void saveNewTask() {
    setState(() {
      db.todoTasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoTasks.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("TO DO"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoTasks.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: db.todoTasks[index][0],
          taskCompleted: db.todoTasks[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteTask: (value) => deleteTask(index),
        ),
      ),
    );
  }
}
