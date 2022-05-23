import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  late double _deviceHeight, _deviceWidth;
  
  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Frivia', style: TextStyle(fontSize: 50, color: Colors.white),),
          MaterialButton(
            color: Colors.white,
            minWidth: _deviceWidth * 0.8,
            height: _deviceHeight * 0.1,
            onPressed: () {
              //Navigator.push(context, route)
            },
            child: const Text('New Game', style: TextStyle(color: Colors.black, fontSize: 30,),),
          ),
        ],
      ),
    );
  }

}