import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class GamePageProvider extends ChangeNotifier {

  final Dio _dio = Dio();
  late BuildContext context;
  int _maxQuestions = 10;
  String _difficulty = 'easy';
  String _questionType = 'boolean';
  int _correctAnswers = 0;

  List? triviaQuestions;
  int _currentQuestion = 0;
  bool gameOver = false;

  GamePageProvider({required this.context, required int maxQuestions, required String difficulty}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _maxQuestions = maxQuestions;
    _difficulty = difficulty;
    _getQuestionsFromAPI();
  }

  Future<void> _getQuestionsFromAPI() async {

    // Sample request for 10 true/false questions on Easy difficulty:
    // GET https://opentdb.com/api.php?amount=10&difficulty=easy&type=boolean
    Response response = await _dio.get('', 
    queryParameters: {
      'amount': _maxQuestions,
      'difficulty': _difficulty,
      'type': _questionType
      }
    );

    dynamic triviaData = jsonDecode(response.toString());
    triviaQuestions = triviaData['results'];
    notifyListeners();
  }

  String getCurrentQuestionText() {
    return triviaQuestions![_currentQuestion]['question'];
  }

  void answerQuestion(String answer) {
    // compare answer string from API to provided answer from player
    // API answer is provided in proper case, but let's compare uppercase strings
    bool isCorrect = triviaQuestions![_currentQuestion]['correct_answer'].toUpperCase() == answer.toUpperCase();

    // increment correct answers counter
    isCorrect ? _correctAnswers++ : null;

    _playerAnswerFeedback(isCorrect);

    // increment current question counter and update UI
    if(_currentQuestion == _maxQuestions - 1) {
      gameOver = true;
    } else {
      _currentQuestion++;  
    }
    notifyListeners();
  }

  void _playerAnswerFeedback(bool isCorrect) async {
    // show a popup with a feedback for the player regarding their answer
    showDialog(context: context, builder: (context) {
      return AlertDialog(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      title: Icon(isCorrect ? Icons.check_circle : Icons.cancel_sharp, color: Colors.white,),
    );
    });
    
    // close AlertDialog after a 1-sec delay
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  String getEndResult() {
    double percentageResult;
    percentageResult = (_correctAnswers / _maxQuestions) * 100;
    return "You answered ${percentageResult.toStringAsFixed(0)}% of the questions correctly";
  }


}