import 'package:flutter/material.dart';
import 'package:todo_app/comps/create_task_box.dart';
import 'package:todo_app/comps/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _taskBox = Hive.box('Tasks');
  TasksDatabase db = TasksDatabase();

  @override
  void initState() {

    //handle opening of app
    if(_taskBox.get("TASKLIST") == null) {
      db.createIntialDate();
    } else {
      db.loadData();
    }

    super.initState();
  }


  //Checkbox toggle for tasks
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateDatabase();
  }

  //Text Controller
  final _controller = TextEditingController();

  //Save new task
  void saveNewTask() {
    setState(() {
      db.taskList.add([ _controller.text, false ]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDatabase();
  }

  //Delete a task
  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDatabase();
  }

  //Create a new task
  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CreateTaskBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.taskList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: db.taskList[index][0], taskCompleted: db.taskList[index][1], onChanged: (value) => checkBoxChanged(value, index), deleteTask: (context) => deleteTask(index));
        },
      ),
    );
  }
}
