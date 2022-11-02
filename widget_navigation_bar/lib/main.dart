
import 'package:widget_navigation_bar/main%20copy.dart';

import 'widget_nav_bar.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: widget_nav_bar(),
    );
  }
}


