import 'package:flutter/material.dart';

class ResponsiveMediaQuery extends StatefulWidget {
  const ResponsiveMediaQuery({Key? key}) : super(key: key);

  @override
  State<ResponsiveMediaQuery> createState() => _ResponsiveMediaQueryState();
}

class _ResponsiveMediaQueryState extends State<ResponsiveMediaQuery> {

  double? _deviceWidth, _deviceHeight, _statusBarHeight, _appBarHeight, _itemWidth;

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _appBarHeight = AppBar().preferredSize.height;
    _itemWidth = _deviceWidth! / 3;
    


    return Scaffold(
      appBar: _responsiveAppBar(),
      body: _responsiveBody(),
    );
  }

  PreferredSizeWidget _responsiveAppBar() {
    return AppBar(
      title: const Text('Responsive'),
    );
  }

  Widget _responsiveBody() {
    return Row(
      children: [
        Container(
          width: _itemWidth,
          height: (_deviceHeight! - _statusBarHeight! - _appBarHeight!),
          color: Colors.blue,
        ),
        Container(
          width: _itemWidth,
          height: (_deviceHeight! - _statusBarHeight! - _appBarHeight!),
          color: Colors.yellow,
        ),
        Container(
          width: _itemWidth,
          height: (_deviceHeight! - _statusBarHeight! - _appBarHeight!),
          color: Colors.red,
        ),
      ],
    );
  }
}