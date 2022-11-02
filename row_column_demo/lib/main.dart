import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "demo",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo for rows and col")),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: const [
          Icon(
            Icons.access_alarm,
            size: 36,
          ),
          Text("Some words"),
          FlutterLogo(
            size: 96,
          ),
        ],
      ),
    );
  }
}
