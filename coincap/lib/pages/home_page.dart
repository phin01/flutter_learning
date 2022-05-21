import 'dart:convert';

import 'package:coincap/models/auxiliary_functions.dart';
import 'package:coincap/models/http_service.dart';
import 'package:coincap/pages/details_page.dart';
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
  late String _selectedCurrency;

  @override
  void initState() {
    super.initState();
    // initialize httpService singleton
    _httpService = GetIt.instance.get<HttpService>();
    _selectedCurrency = 'bitcoin';
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
            children: [
              _selectCoinDropDown(),
              _dataWidgets(),
            ]
          ),
        ),
      ),
    );
  }

  Widget _selectCoinDropDown() {
    List<String> cryptoList = ['bitcoin', 'ethereum', 'whatever'];

    return DropdownButton(
      items: createDropDownItems(cryptoList), 
      value: _selectedCurrency,
      dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,),
      underline: Container(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,),
      onChanged: (ddSelection){
        setState(() {
        _selectedCurrency = ddSelection.toString();
        });
      },
      );
  }

  Widget _dataWidgets() {
    return FutureBuilder(
      future: _httpService.get('/coins/$_selectedCurrency'),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData) {
          try {
            // full json response from API
            Map apiData = jsonDecode(snapshot.data.toString());

            // required data for widgets
            String imageURL = apiData['image']['large'];
            num dollarPrice = apiData['market_data']['current_price']['usd'];
            num dollarVariation = apiData['market_data']['price_change_percentage_24h_in_currency']['usd'];
            String description = apiData['description']['en'];

            return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(onDoubleTap: () {navigateToPage(context, DetailsPage());},
                child: _currencyImage(imageURL)),
              _currentPriceDollar(dollarPrice),
              _currentVariationDollar(dollarVariation),
              _currencyDescription(description)
            ],
          );
          } catch(e) {
            return const Center(child: Text('Crypto Currency data not found'));
          }
        } else {
          // waiting for API to respond, render a progress indicator
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        }
      }
    );
  }

  Widget _currentPriceDollar(num price) {
    return Text(
      "${price.toStringAsFixed(2)} USD",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }

  Widget _currentVariationDollar(num variation) {
    return Text(
      "${variation.toStringAsFixed(2)}%",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
  
  Widget _currencyImage(String imageURL) {
    return Container(
      height: _deviceHeight * 0.15,
      width: _deviceWidth * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageURL))
      ),
    );
  }

  Widget _currencyDescription(String description) {
    return Container(
      height: _deviceHeight * 0.5,
      width: _deviceWidth * 0.9,
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.02, horizontal: _deviceWidth * 0.02),
      margin: EdgeInsets.symmetric(vertical: _deviceHeight * 0.02, horizontal: _deviceWidth * 0.02),
      color: const Color.fromRGBO(83, 88, 206, 0.6),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

}