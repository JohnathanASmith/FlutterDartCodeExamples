import 'package:flutter/material.dart';
import 'package:widget_navigation_bar/main%20copy.dart';

class widget_nav_bar extends StatefulWidget {
  const widget_nav_bar({super.key});

  @override
  State<widget_nav_bar> createState() => _widget_nav_barState();
}

class _widget_nav_barState extends State<widget_nav_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: something(),

    );
  }
}