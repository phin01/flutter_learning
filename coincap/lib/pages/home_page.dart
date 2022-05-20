import 'package:coincap/models/auxiliary_functions.dart';
import 'package:coincap/models/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  // device information
  late double _deviceHeight, _deviceWidth;

  // instance of HttpService calls which will handle the API requests
  late HttpService _httpService;

  @override
  void initState() {
    super.initState();
    // initialize httpService singleton
    _httpService = GetIt.instance.get<HttpService>();
  }

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    // Home page is a Scaffold with a single column of information
    // It is wrapped in a SafeArea widget to avoid overlapping system widgets
    // Children widgets are spaced evenly on vertical axis and centered on horizontal axis
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectCoinDropDown(),
            ]
          ),
        ),
      ),
    );
  }

  Widget _selectCoinDropDown() {
    List<String> cryptoList = ['bitcoin', 'ethereum', 'whatever'];
    return DropdownButton(
      items: DropDownItemsBuilder().fromList(cryptoList), 
      value: cryptoList.first,
      dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,),
      underline: Container(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,),
      onChanged: (_){}
      );
  }
}