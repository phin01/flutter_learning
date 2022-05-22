import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {

  late double _deviceHeight, _deviceWidth;
  
  @override
  Widget build(BuildContext context) {
    
    // device size information
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return _buildUI();
  }

  // This widget will be the general placeholder for the game's UI
  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.05, horizontal: _deviceWidth * 0.05),
          child: _gameUI()
          ),
      ),
    );
  }

  // This widget will be the placeholder for the game UI widgets:
  // - A widget for the trivia question
  // - A widget for true/false answer selection
  Widget _gameUI() {
    return Center(
      child: Column(
        // column layout
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        // game data
        children: [
          _questionText(),
          Column(
            children: [
              _answerButton(Colors.green, "True"),
              SizedBox(height: _deviceHeight * 0.02,),
              _answerButton(Colors.red, "False"),
            ],
          )
        ],
      ),
    );
  }

  // This widget will hold the trivia question
  Widget _questionText(){
    return const Text(
      "Test question here",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // This widget will generate the True/False buttons
  Widget _answerButton(Color buttonColor, String buttonText) {
    return MaterialButton(
      color: buttonColor,
      minWidth: _deviceWidth * 0.8,
      height: _deviceHeight * 0.1,
      onPressed: () {},
      child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 18,),),
      );
  }
}