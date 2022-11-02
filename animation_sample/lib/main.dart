import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title:  "Animation Demo",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Home"),
      ),
      body: const AnimatedTextStyleWidget(),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.all(padValue), 
          duration: Duration(seconds: 2),
          child: Container(
            width: 250, 
            height: 100, 
            color: Colors.blue,),),
          Text("Padding: $padValue" ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (padValue == 0.0) {
                  padValue = 100;
                } else {
                  padValue = 0.0;
                }
              });
            }, 
            child: Text("Change Padding"))
      ],
    );
  }
}


class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
    child: Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.elasticInOut,
        width: selected ? 200.0 : 100.0,  // if(selected) then 200.0 else 100.0
        height: selected ? 100.0 : 200.0,
        color: selected ? Colors.red : Colors.blue,
        alignment: selected ? Alignment.center : Alignment.topCenter,
        child: FlutterLogo(size: 75,)
        ),
    ));
  }
}


class AnimatedTextStyleWidget extends StatefulWidget {
  const AnimatedTextStyleWidget({super.key});

  @override
  State<AnimatedTextStyleWidget> createState() => _AnimatedTextStyleWidgetState();
}

class _AnimatedTextStyleWidgetState extends State<AnimatedTextStyleWidget> {

  Color fgColor = Colors.blueAccent;
  double size = 14.0;
  FontWeight weight = FontWeight.bold;
  double spacing = 1.0;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count = (count + 1) % 3;

          switch (count) {
            case 0:
              fgColor = Colors.blueAccent;
              size = 14;
              weight = FontWeight.normal;
              spacing = 1.0;
              break;
            case 1:
              fgColor = Colors.purple;
              size = 24.0;
              weight = FontWeight.w500;
              spacing = 6.0;
              break;
            case 2:
              fgColor = Colors.orange;
              size = 48.0;
              weight = FontWeight.bold;
              spacing = 12;
              break;
            default:
          }


        });
      },
      child: Center(
        child: Column(
          children: [
            const Text("I love animation!", 
            style: TextStyle(fontSize: 18, color: Colors.blueAccent),),

          AnimatedDefaultTextStyle(
            child: const Text("I love it more!"), 
            style: TextStyle(
              color: fgColor,
              fontSize: size,
              fontWeight: weight,
              wordSpacing: spacing
            ),
            curve: Curves.easeInOut, 
            duration: Duration(seconds: 2),
            ),
            Text("Count: $count")
          ],
        ),
      ),
    );
  }
}