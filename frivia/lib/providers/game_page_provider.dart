import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class GamePageProvider extends ChangeNotifier {

  final Dio _dio = Dio();
  late BuildContext context;
  int _maxQuestions = 10;
  String _difficulty = 'easy';
  String _questionType = 'boolean';

  late List _triviaQuestions;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
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
    _triviaQuestions = triviaData['results'];
  }
}