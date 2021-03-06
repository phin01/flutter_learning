import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Layout Builder')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _responsiveLayout(),
      ),
    );
  }

  Widget _responsiveLayout() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        double _layoutWidth = constraints.maxWidth;

        if(_layoutWidth < 600) {
          return const Text('small devices');
        } else if(_layoutWidth < 960) {
          return const Text('medium devices');
        } else {
          return const Text('large devices');
        }
      },
    );
  }
}