import 'package:flutter/material.dart';

class ResponsiveRowColumn extends StatefulWidget {
  const ResponsiveRowColumn({Key? key}) : super(key: key);

  @override
  State<ResponsiveRowColumn> createState() => _ResponsiveRowColumnState();
}

class _ResponsiveRowColumnState extends State<ResponsiveRowColumn> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Container(color: Colors.red,)),
          Expanded(flex: 7, child: Row(children: [
            Expanded(flex: 3, child: Container(color: Colors.purple),),
            Expanded(flex: 8, child: Container(color: Colors.yellow),),
            Expanded(flex: 2, child: Container(color: Colors.indigo),),
          ],)),
          Expanded(flex: 1, child: Container(color: Colors.green,)),
        ],
      ),
    );
  }
}