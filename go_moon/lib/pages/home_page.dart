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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: _destinationDropDownWidget(),),
                  Padding(padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _travelersInformationWidget(),
                        _flightClassWidget(),
                      ], ), ),
                  Padding(padding: const EdgeInsets.all(8.0), child: _rideButtonWidget(),),
                ],
              )
          ],),
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
      "Flight Booker",
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    List<String> ddStrings = ['Airport #1', 'Airport #2', 'Airport #3'];
    return CustomDropDownButton(values: ddStrings, width: _deviceWidth);
  }

  Widget _travelersInformationWidget() {
    List<String> ddStrings = ['Traveler #1', 'Traveler #2', 'Traveler #3'];
    return CustomDropDownButton(values: ddStrings, width: (_deviceWidth - 64) * 0.5);
  }

  Widget _flightClassWidget() {
    List<String> ddStrings = ['Economy', 'Business', 'First Class'];
    return CustomDropDownButton(values: ddStrings, width: (_deviceWidth - 64) * 0.5);
  }

  Widget _rideButtonWidget() {
    return Container(
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book Ride",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}