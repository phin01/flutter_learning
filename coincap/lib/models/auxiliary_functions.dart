import 'package:flutter/material.dart';

class DropDownItemsBuilder {

  DropDownItemsBuilder();

  List<DropdownMenuItem<String>> fromList(List<String> values) {
    return values.map((String ddString) {
        return DropdownMenuItem<String>(
          value: ddString,
          child: Text(ddString),
        );
      }
    ).toList();
  }
}