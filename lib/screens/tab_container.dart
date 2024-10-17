import 'package:fc_hackathon_2024/screens/home.dart';
import 'package:fc_hackathon_2024/screens/leaderboard.dart';
import 'package:fc_hackathon_2024/screens/personal.dart';
import 'package:flutter/material.dart';

class TabContainer extends StatelessWidget {
  const TabContainer({super.key});

  static const route = "/tabContainer";
  static const routeName = "TabContainer";

  @override
  Widget build(BuildContext context) {
    const viewList = [Home(), Leaderboard(), Personal()];

    final tabList = [
      const SizedBox(
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Column(
              children: [Icon(Icons.home_rounded), Text("Home")],
            ),
          )),
      const SizedBox(
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Column(
              children: [Icon(Icons.leaderboard_rounded), Text("Leaderboard")],
            ),
          )),
      const SizedBox(
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Column(
              children: [Icon(Icons.person_2_rounded), Text("Personal")],
            ),
          )),
    ];

    return DefaultTabController(
      length: viewList.length,
      animationDuration: const Duration(milliseconds: 500),
      child: Scaffold(
        body: const TabBarView(children: viewList),
        bottomNavigationBar: TabBar(tabs: tabList),
      ),
    );
  }
}
