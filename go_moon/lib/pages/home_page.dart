import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown.dart';

class HomePage extends StatelessWidget {

  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pageTitle(),
            _destinationDropDownWidget(),
          ],
        ),
      ),
    );
  }

  // Returns a Container widget with the image of the Astronaut
  Widget _astronautImageWidget() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/astro_moon.png"),
            fit: BoxFit.fill,
          )
        ),
      );
  }

  // Returns a Text widget with the page's title
  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    List<String> ddStrings = ['Moon Station #1', 'Moon Station #2', 'Moon Station #3'];
    return CustomDropDownButton(values: ddStrings, width: _deviceWidth);
  }

}