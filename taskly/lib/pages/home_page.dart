import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  String? _newTaskContent;

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
          return _tasksList();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // ListView Widget
  Widget _tasksList() {
    return ListView(
      children: [
        _tasksListElement(),
      ],
    );
  }

  // Elements of the ListView
  Widget _tasksListElement() {
    return ListTile(

      title: const Text(
        'Do Laundry',
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
        ),
      ), // title

      subtitle: Text(
        DateTime.now().toString(),
        style: const TextStyle(
        ),
      ), // subtitle

      trailing: const Icon(
        Icons.check_box_outlined,
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
          onSubmitted: (value) {},
          onChanged: (value) {
            setState(() {
              _newTaskContent = value;  
            });
          },
        ),
      );
    },);
  }




}

