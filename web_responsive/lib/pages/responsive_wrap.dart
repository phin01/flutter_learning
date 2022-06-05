import 'package:flutter/material.dart';


class ResponsiveWrap extends StatefulWidget {
  ResponsiveWrap({Key? key}) : super(key: key);

  @override
  State<ResponsiveWrap> createState() => _ResponsiveWrapState();
}

class _ResponsiveWrapState extends State<ResponsiveWrap> {

  final double _height = 100;
  final double _width = 200;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black26,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 30,
          runSpacing: 10,

          children: [
            _sampleContainer(Colors.green),
            _sampleContainer(Colors.blue),
            _sampleContainer(Colors.yellow),
            _sampleContainer(Colors.red),
            _sampleContainer(Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _sampleContainer(Color containerColor) {
    return Container(
      color: containerColor,
      height: _height,
      width: _width,
    );
  }
}