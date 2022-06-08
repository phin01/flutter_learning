import 'package:flutter/material.dart';
import 'package:web_responsive/widgets/mobile_appbar.dart';
import 'package:web_responsive/widgets/web_appbar.dart';

class ResponsiveSampleShop extends StatefulWidget {
  const ResponsiveSampleShop({Key? key}) : super(key: key);

  @override
  State<ResponsiveSampleShop> createState() => _ResponsiveSampleShopState();
}

class _ResponsiveSampleShopState extends State<ResponsiveSampleShop> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){

      double _width = constraints.maxWidth;
      
      return Scaffold(
        appBar: appBarBuilder(_width),

    );
    });
  }

  PreferredSizeWidget appBarBuilder(double width) {
    Widget appBar = width < 600 ? const MobileAppBar() : const WebAppBar();
    return PreferredSize(preferredSize: Size(width, AppBar().preferredSize.height), child: appBar);
  }
}