import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      title: "Containers and Positioning", home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Row(
            children: const [
              Expanded(flex: 2, child: TealBox()),
              Expanded(flex: 4, child: TealBox()),
              Expanded(flex: 2, child: TealBox()),
            ],
          ),
          Row(
            children: const [
              Expanded(flex: 4, child: TealBox()),
              Spacer(flex: 2,),
              TealBox(),
              Spacer(flex: 1,),
              TealBox(),
            ],
          ),
        ]));
  }
}

class TealBox extends StatelessWidget {
  const TealBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 48,
        // height: 48,
        margin: const EdgeInsets.only(left: 3, top: 6, right: 3),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(width: 3),
          // borderRadius: BorderRadius.circular(90),
          // shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     spreadRadius: 3,
          //     blurRadius: 10,
          //   )
          // ]
        ),
        child: const Icon(Icons.beach_access));
  }
}
