import 'package:flutter/material.dart';

import 'Home.dart';
import 'Prayer_time.dart';

class Navigation_Bar extends StatefulWidget{

  @override
  State<Navigation_Bar> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar>
    with SingleTickerProviderStateMixin{

  late TabController tabController;
  int current_page=0;
  var dt=DateTime.now().toUtc();


  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    print(dt.day);
    print(dt.hour);
    print(dt.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          Home(),
          PrayerTime()
        ],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              child: Text("Home"),
            ),
            Tab(
              icon: Icon(Icons.book),
              child: Text("Prayer Time"),
            )
          ],
        ),
      ),
    );
  }
}
