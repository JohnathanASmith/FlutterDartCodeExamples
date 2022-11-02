import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Rate My Pet",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // This is a "constant" (const) constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The basis for a UI screen
      appBar: AppBar(
        title: const Text("Rate My Pet!"),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Image.asset(
            "assets/images/pug.jpg",
            width: 256,
          ),
          Text(
            "Pug Name",
            style: TextStyle(color: Colors.grey[500], fontSize: 18),
          ),
          const VotingWidget()
        ],
      ),
    );
  }
}

// highlight hit f2 and it changes all names

class VotingWidget extends StatefulWidget {
  const VotingWidget({super.key});

  // All ststful widgets MUST override this "createState():" method
  // "Basically, you are seperating the widget from the state it holds"
  @override
  State<VotingWidget> createState() => _VotingWidgetState();
}

class _VotingWidgetState extends State<VotingWidget> {
  int count = 0; // This is the "state" I care about

  // We want to have a Row with two buttons (upvote and downvote)
  // and count of the current votes
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        icon: const Icon(Icons.remove_circle),
        iconSize: 30,
        color: Colors.amber,
        onPressed: () {
          if (count > 0) {
            count--;
          }
          setState(() {});
        },
      ),
      Text(
        "$count",
        style: const TextStyle(color: Colors.amber),
      ),
      IconButton(
        icon: const Icon(Icons.add_circle),
        iconSize: 30,
        color: Colors.amber,
        onPressed: () {
          count++;
          setState(() {});
        },
      )
    ]);
  }
}
