import 'dart:convert';

import 'package:coincap/models/app_config.dart';
import 'package:coincap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadConfig();
  runApp(const MyApp());
}

Future<void> _loadConfig () async {

  // load main.json from Assets folder
  String configString = await rootBundle.loadString('assets/config/main.json');
  Map configJson = jsonDecode(configString);

  // Create singleton instance of AppConfig class with information from loaded json file in Assets folder
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(COIN_API_BASE_URL: configJson['COIN_API_BASE_URL'])
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(88, 60, 197,1.0),
      ),
      home: HomePage(),
    );
  }
}

