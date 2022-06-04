import 'package:flutter/material.dart';
import 'package:web_responsive/pages/responsive_row_column.dart';

import 'pages/responsive_mediaquery.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      //home: ResponsiveMediaQuery(),
      home: ResponsiveRowColumn(),
    )
  );
}

