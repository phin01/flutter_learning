import 'package:flutter/material.dart';

class ResponsiveOrientation extends StatefulWidget {
  ResponsiveOrientation({Key? key}) : super(key: key);

  @override
  State<ResponsiveOrientation> createState() => _ResponsiveOrientationState();
}

class _ResponsiveOrientationState extends State<ResponsiveOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orientation Builder')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisSpacing: 1,
            mainAxisSpacing: 2,
            // When the device is using Portrait orientation, the grid will display two columns. 
            // When on landscape orientation, the grid will display 3 columns
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: <Widget> [
              _sampleContainer(Colors.green),
              _sampleContainer(Colors.blue),
              _sampleContainer(Colors.red),
              _sampleContainer(Colors.yellow),
              _sampleContainer(Colors.purple),
              _sampleContainer(Colors.orange),
            ],
          );
        },
      ),
    );
  }

  Widget _sampleContainer(Color containerColor) {
    return Container(
      color: containerColor,
    );
  }
}