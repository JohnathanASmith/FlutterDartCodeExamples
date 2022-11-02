import 'package:flutter/material.dart';
import 'widget_nav_bar.dart';

something() { 
   return BottomAppBar(
    color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          IconButton(
            icon: Icon(Icons.dynamic_feed,),
            onPressed: () {},
            iconSize: 26,
            ),
            Text("Feed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,))
            ]
            )
          ,

            IconButton(
              icon: Icon(Icons.recommend),
            onPressed: () {},
            )
          ,

      ],
    ),
   );
    
}