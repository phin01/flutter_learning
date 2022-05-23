import 'package:flutter/material.dart';
import 'package:frivia/providers/game_page_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {

  late double _deviceHeight, _deviceWidth;

  late GamePageProvider _gamePageProvider;

  
  @override
  Widget build(BuildContext context) {
    
    // device size information
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (BuildContext context) => GamePageProvider(context: context),
      child: _buildUI(),
    );
  }

  // This widget will build the game's UI with the provider to handle state changes
  Widget _buildUI() {
    return Builder(
      builder: (context) {
        _gamePageProvider = context.watch<GamePageProvider>();

        // Load UI if questions have been loaded from API,
        // Otherwise, load a circular progress indicator
        if(_gamePageProvider.triviaQuestions != null) {
          return SafeArea(
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.05, horizontal: _deviceWidth * 0.05),
              child: _gameUI()
            ),
          ),
        );
        } else {
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        }
      }
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
    return Text(
      _gamePageProvider.getCurrentQuestionText(),
      style: const TextStyle(
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
      onPressed: () {
        _gamePageProvider.answerQuestion(buttonText);
      },
      child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 18,),),
      );
  }
}