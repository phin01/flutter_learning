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
    );
  }


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


}

