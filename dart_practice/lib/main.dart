import 'package:flutter/material.dart';
import 'practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var practiceObj = Practice();
    var nameList = ["Alice", "Bob", "Charlie"];

    // TODO: Uncomment the following line for Part 2 and change to your info.
    var person = Person("Johnathan", "Smith", 22);

    var optionalperson = OptionalPerson("Bob", "Ross", 50);
    var optionalperson2 = OptionalPerson("Steve", "Block");

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'The results of your Dart functions will (mostly) display below.',
            ),
            const Text(
              'The values will refresh when you save your code or re-run.',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Practice',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                'The last letter of "vibe" is: ${practiceObj.getLast("vibe")}'),
            Text('Calling getNth on the list of $nameList'),
            Text('2: ${practiceObj.getNth(nameList, 2)}'),
            Text('1: ${practiceObj.getNth(nameList, 1)}'),
            Text('0: ${practiceObj.getNth(nameList, 0)}'),

            // // TODO: Uncomment the next three lines when ready to work on the Person class
            const SizedBox(
              height: 10,
            ),
            const Text('Person', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(person.getWelcome()),

            // // TODO: Uncomment the next two lines when ready to work on the OptionalPerson class
            const SizedBox(
              height: 10,
            ),
            const Text('class OptionalPerson',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(optionalperson.getWelcome()),
            Text(optionalperson2.getWelcome())
          ],
        ),
      ),
    );
  }
}
