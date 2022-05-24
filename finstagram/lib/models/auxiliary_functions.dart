import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> createDropDownItems(List<String> values) {
  return values.map((String ddString) {
      return DropdownMenuItem<String>(
        value: ddString,
        child: Text(ddString),
      );
    }
  ).toList();
}

Future<dynamic> navigateToPage(BuildContext context, Widget destinationPage) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return destinationPage;
      }
    )
  );
}

bool emailRegExValidator(String email) {
  return email.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
}