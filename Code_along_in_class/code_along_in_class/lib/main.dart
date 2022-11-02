import 'package:flutter/material.dart';

void main() {
  runApp(CollageApp());
}

class CollageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Collage",
        home: Scaffold(
            appBar: AppBar(title: Text("Collage")),
            body: Center(
                child: IntrinsicWidth(
              child: Column(children: [
                DecoratedText(
                    label: "PLay", imageFileName: "assets/images/play.jpeg"),
                SizedBox(height: 5),
                DecoratedText(
                    label: "Map", imageFileName: "assets/images/map.jpeg"),
                SizedBox(height: 5),
                DecoratedText(
                    label: "Store",
                    imageFileName: "assets/images/seven-eleven.jpeg"),
                SizedBox(height: 5),
                DecoratedText(
                    label: "Wilmington",
                    imageFileName: "assets/images/wilmington.jpeg"),
              ]),
            ))));
  }
}

class DecoratedText extends StatelessWidget {
  DecoratedText({required this.label, required this.imageFileName});

  String label;
  // Icon icon;
  String imageFileName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("You tapped on $label");
        },
        onDoubleTap: () {
          print("You double tapped on $label");
        },
        onLongPress: () {
          print("You long pressed on $label");
        },
        child: Ink(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(width: 5),
              Image.asset(
                imageFileName,
                width: 50,
                height: 50,
              ),
              Padding(
                  child: Text(label,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.all(8)),
            ]),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 218, 255),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8))));
  }
}
