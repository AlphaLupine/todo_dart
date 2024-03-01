import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase {

  List taskList = [];

  // Open box
  final _taskBox = Hive.box('Tasks');

  void createIntialDate() {
    taskList = [
      ["Welcome! Check me off", false],
      ["Try swiping me left", false]
    ];
  }

  void loadData() {
    taskList = _taskBox.get("TASKLIST");
  }

  void updateDatabase() {
    _taskBox.put("TASKLIST", taskList);
  }

}