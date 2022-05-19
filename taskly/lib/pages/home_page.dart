import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {

  

  // blank constructor
  HomePage();
  
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {

  // device information
  late double _deviceHeight, _deviceWidth;

  // task variables
  Box? _box;

  // blank constructor
  _HomePageState();

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _tasklyAppBar(_deviceWidth, _deviceHeight),
      body: _tasksBuilder(),
      floatingActionButton: _addTaskButton(),
    );
  }


  // TaskBar Widget
  PreferredSizeWidget _tasklyAppBar(double deviceWidth, double deviceHeight) {
    return AppBar(
      toolbarHeight: deviceHeight * 0.15,
      title: const Text(
        "Taskly",
        style: TextStyle(
          fontSize: 25,
        ),),
    );
  }

  // ListView FutureBuilder
  Widget _tasksBuilder() {
    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          _box = snapshot.data;
          return _tasksList();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // ListView Widget
  Widget _tasksList() {

    // _box is defined prior to this Widget call, so we can be sure it is not null
    List tasks = _box!.values.toList();
    return ListView.builder(itemCount: tasks.length, itemBuilder: (BuildContext context, int index) {
      Task currentTask = Task.fromMap(tasks[index]);
      return _tasksListElement(currentTask);
    },);
  }

  // Elements of the ListView
  Widget _tasksListElement(Task task) {

    return ListTile(

      title: Text(
        task.content,
        style: TextStyle(
          decoration: task.done ? TextDecoration.lineThrough : null,
        ),
      ), // title

      subtitle: Text(
        task.timestamp.toString(),
        style: const TextStyle(
        ),
      ), // subtitle

      trailing: Icon(
        task.done ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
        color: Colors.red,
      ), // trailing

    );
  }

  // Button to Add Tasks
  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopUp,
      child: const Icon(
        Icons.add,
      ), // button icon
    );
  }

  void _displayTaskPopUp() {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Add new Task'),
        content: TextField(
          onSubmitted: (value) {
            Task newTask = Task(content: value, timestamp: DateTime.now(), done: false);
            _box!.add(newTask.toMap());
            Navigator.pop(context);
          },
        ),
      );
    },);
  }




}

