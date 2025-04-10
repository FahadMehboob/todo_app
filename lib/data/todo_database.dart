import 'package:hive/hive.dart';

class TodoDatabase {
  List todoTasks = [];
  final _myBox = Hive.box("myBox");

  void createInitialData() {
    todoTasks = [
      ["Make Assignment", false],
      ["Do Exercise", false],
    ];
  }

  void loadData() {
    todoTasks = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoTasks);
  }
}
