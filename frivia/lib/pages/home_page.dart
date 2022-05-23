import 'package:flutter/material.dart';
import 'package:frivia/models/auxiliary_functions.dart';
import 'package:frivia/pages/game_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  late double _deviceHeight, _deviceWidth;
  
  double _difficultyValue = 0;
  final Map _difficultyLabels = {
    0: 'Easy',
    1: 'Medium',
    2: 'Hard'
  };
  
  
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Frivia', style: TextStyle(fontSize: 50, color: Colors.white),),
                Text(_difficultyLabels[_difficultyValue], style: TextStyle(fontSize: 15, color: Colors.white),),
              ],
            ),
            
            Slider(
              value: _difficultyValue,
              max: 2,
              divisions: 2,
              onChanged: (double newValue) {
                setState(() {
                  _difficultyValue = newValue;
                },);
              },
            ),
      
            MaterialButton(
              color: Colors.white,
              minWidth: _deviceWidth * 0.8,
              height: _deviceHeight * 0.1,
              onPressed: () {
                navigateToPage(context, GamePage(maxQuestions: 10, difficulty: _difficultyLabels[_difficultyValue].toString().toLowerCase(),));
              },
              child: const Text('Start', style: TextStyle(color: Colors.black, fontSize: 30,),),
            ),
          ],
        ),
      ),
    );
  }

}