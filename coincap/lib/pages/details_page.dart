import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  late Map currencyRates;

  DetailsPage({Key? key, required this.currencyRates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List currencyNames = currencyRates.keys.toList();
    List exchangeRates = currencyRates.values.toList();
    
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) { Navigator.pop(context);},
        child: Scaffold(
          body: ListView.builder(itemCount: currencyRates.length, itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${currencyNames[index]} : ${exchangeRates[index]}",
              style: TextStyle(color:  Colors.white, fontSize: 15,),),
            );
          },),
        ),
      ),
    );
  }
}