import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {

  final List<String> values;
  final double width;

  const CustomDropDownButton({required this.values, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> ddItems = values.map((String ddString) {
        return DropdownMenuItem<String>(
          value: ddString,
          child: Text(ddString),
        );
      }
    ).toList();
    
    return Container(
      // styling outside dropdown
      decoration: BoxDecoration(
        color:  const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),

      child: DropdownButton(
        // styling inside dropdown
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        style: const TextStyle(color: Colors.white),
        
        // data for dropdown
        items: ddItems,
        onChanged: (_) { },
        value: values.first,
        ),
    );
  }

}