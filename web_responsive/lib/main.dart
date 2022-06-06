import 'package:flutter/material.dart';
import 'package:web_responsive/pages/responsive_row_column.dart';
import 'package:web_responsive/pages/responsive_wrap.dart';

import 'pages/responsive_mediaquery.dart';
import 'pages/responsive_orientation.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      // home: ResponsiveMediaQuery(),
      // home: ResponsiveRowColumn(),
      // home: ResponsiveWrap(),
      home: ResponsiveOrientation(),
    )
  );
}

