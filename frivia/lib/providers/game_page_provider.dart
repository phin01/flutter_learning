import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class GamePageProvider extends ChangeNotifier {

  final Dio _dio = Dio();
  late BuildContext context;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
  }
}