

import 'package:flutter/material.dart';
import 'package:lists_and_grids/bob_data.dart';
import 'package:lists_and_grids/pageview-screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(title: "BobRoss", home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BobRossData data = BobRossData();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text("Select your destination"), 
            decoration: BoxDecoration(color: Colors.blue),),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home Screen"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List Screen"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListScreen(data.paintingNames),));
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3),
              title: Text("Grid Screen"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GridScreen(data.paintings),));
              },
            ),
          ],

        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListScreen(data.paintingNames),)
                );
              },
              child: Text("Go to ListView Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GridScreen(data.paintings),)
                );
              },
              child: Text("Go to GridView Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailScreen(),)
                );
              },
              child: Text("Go to Detail Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PageViewScreenWithIndicator(),)
                );
              },
              child: Text("Go to PageView Screen"),
            )
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen(this.paintingNames, {super.key});

  final List<String> paintingNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView")),
      backgroundColor: Colors.grey[800],
      body: ListView.builder(
        // scrollDirection: Axis.horizontal,
        // reverse: true,
        itemCount:  paintingNames.length,
        itemBuilder: (context, index) {
          return Card(child:
          ListTile(
            leading: Icon(Icons.brush),
            tileColor: Colors.white,
            title: Text(paintingNames[index]),
            subtitle: Text("By Bob Ross"),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              print("You tapped on ${paintingNames[index]}");
            },
          )
          );






          // return Container(
          //   decoration: BoxDecoration(border: Border.all(width: 3), color: Colors.white),
          //   child: Text(paintingNames[index], style: TextStyle(fontSize: 32, color: Colors.teal),),
          // );
      },),
    );
  }
}
// this is the widget used for the grid view screen. It uses the MyCardforDisplay 
// for each item in the grid.
class GridScreen extends StatelessWidget {
  const GridScreen(this.paintings, {super.key});

  final List<BobRossPainting> paintings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView")),
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: paintings.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), 
        itemBuilder: (context, index) {
          return MyCardForDisplay(paintings[index]);



          //return Text(paintings[index].title);
        },

        ),
    );
  }
}


class MyCardForDisplay extends StatelessWidget {
  const MyCardForDisplay(this.painting, {super.key});

  final BobRossPainting painting;

  @override
  Widget build(BuildContext context) {
    // to make the card interactive have to put the card inside a gesture detector
    return 
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(painting: painting),));
      },
      child: Card(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
        children: [
          Image.asset("assets/images/painting${painting.paintingId}.png"),
          Text(painting.title, 
            style: TextStyle(
              color: Colors.grey[700], 
              fontSize: 13, 
              fontWeight: FontWeight.bold),
              ),
            Row(children: [
              Text("S.${painting.season} Ep.${painting.episode}"),
              Text("Colors: ${painting.colorCount}")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
        ],
      ),
    )));
  }
}


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.painting});

  final BobRossPainting? painting;

  @override
  Widget build(BuildContext context) {

    Widget contentToShow;

    // we had two entry points to the detail screen but only one passed in
    // information. This determined if inforation was passed in and if so 
    // show it
    if (painting == null) {
      contentToShow = Text("Nothing to Show! How did you get here?");
    }
    else {
      contentToShow = Image.asset("assets/images/painting${painting!.paintingId}.png");
    }



    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            contentToShow,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
