import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "More Positioning", home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Home Screen
    return Scaffold(
      appBar: AppBar(),
      body: 
      Padding(padding: const EdgeInsets.all(8),
        
        
        
        child:Column(
        children: [
          CoolioCard(),
          const Padding(padding: EdgeInsets.all(16), child: 
          Align(alignment: Alignment.topRight, child:
          Text("Would you like to go skydiving?"),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              PrettyButton("Yes"),
              PrettyButton("Maybe"),
              PrettyButton("No"),
              PrettyButton("Why would you ask me that")
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            
            children: const [
              PrettyButton("Yes"),
              PrettyButton("Maybe"),
              PrettyButton("No"),
              PrettyButton("Why would you ask me that")
            ],
          ),
        ],
      ),)
    );
  }
}

class PrettyButton extends StatelessWidget {
  const PrettyButton(this.buttonText, {super.key});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.teal,
              ])),
      child: 
      Align(alignment: Alignment.center, child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold),)
      ),
    );
  }
}




class CoolioCard extends StatelessWidget {
  const CoolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset("assets/images/parachutist.jpg"),
        Container(
          height: 200,
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Colors.black.withAlpha(0),
            Colors.black87
          ])
        ),),
        Text("Would you like to go skydiving", style: TextStyle(color: Colors.white, fontSize: 20),)
      ],
    );
  }
}
