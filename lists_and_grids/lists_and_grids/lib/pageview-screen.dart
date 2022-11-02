import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lists_and_grids/bob_data.dart';
import 'package:lists_and_grids/main.dart';

// class PageViewScreen extends StatelessWidget {
//   PageViewScreen({super.key});

//   final List<BobRossPainting> _paintings = BobRossData().paintings;
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(title: Text("PageView Screen")),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _paintings.length,
//         itemBuilder: (context, index) => MyCardForDisplay(_paintings[index])),





//       // body: PageView(
//       //   controller: _pageController,
//       //   children: [
//       //   //   MyCardForDisplay(_paintings[0]),
//       //   //   MyCardForDisplay(_paintings[1]),
//       //   //   MyCardForDisplay(_paintings[2])
//       //   ],
//       // ),
//     );
//   }
// }

class PageViewScreenWithIndicator extends StatefulWidget {
  const PageViewScreenWithIndicator({super.key});

  @override
  State<PageViewScreenWithIndicator> createState() =>
      _PageViewScreenWithIndicatorState();
}

class _PageViewScreenWithIndicatorState
    extends State<PageViewScreenWithIndicator>
    with SingleTickerProviderStateMixin {
  final List<BobRossPainting> paintings = BobRossData().paintings;

  final PageController _pageController = PageController();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: paintings.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView demo")),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: _pageController,
              itemCount: paintings.length,
              onPageChanged: (value) => setState(() {
                _tabController?.index = value;
              }),
              itemBuilder: (context, index) =>
                  MyCardForDisplay(paintings[index]),
            ),
          ),
          TabPageSelector(
            controller: _tabController,
          ),
        ],
      ),
    );
  }
}
