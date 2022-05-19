import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  

  // blank constructor
  HomePage();
  
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {

  late double _deviceHeight, _deviceWidth;

  // blank constructor
  _HomePageState();

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _tasklyAppBar(_deviceWidth, _deviceHeight),
      body: _tasksList(),
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
      child: const Icon(
        Icons.add,
      ), // button icon

      onPressed: () {
      }
    );
  }
}

