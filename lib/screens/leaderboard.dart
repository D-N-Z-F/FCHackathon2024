import 'package:fc_hackathon_2024/main.dart';
import 'package:fc_hackathon_2024/widgets/podium_item.dart';
import 'package:fc_hackathon_2024/widgets/podium_item_2.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    users.sort((a, b) => b.weeklyEarned.compareTo(a.weeklyEarned));
    final topThreeWeekly = [users[1], users[0], users[3]];
    final topFourOnwards = users.sublist(2);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard (Weekly)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isPortrait
          ? Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
                top: isPortrait ? 50 : 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: topThreeWeekly
                        .map((user) => PodiumItem(
                            name: user.name,
                            weeklyEarned: user.weeklyEarned,
                            rank: switch (topThreeWeekly.indexOf(user)) {
                              0 => 2,
                              2 => 3,
                              _ => 1,
                            }))
                        .toList(),
                  ),
                  const SizedBox(height: 20), // Add spacing between sections

                  // Expanded widget allows the scroll view to take up remaining space
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: topFourOnwards
                              .map((user) => Column(
                                    children: [
                                      PodiumItem2(
                                        name: user.name,
                                        weeklyEarned: user.weeklyEarned,
                                        username: user.username,
                                        rank: topFourOnwards.indexOf(user) + 1,
                                        isUp: user.isUp,
                                      ),
                                      if (topFourOnwards.indexOf(user) !=
                                          topFourOnwards.length - 1)
                                        const Divider(color: Colors.black12),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: topThreeWeekly
                          .map((user) => PodiumItem(
                              name: user.name,
                              weeklyEarned: user.weeklyEarned,
                              rank: switch (topThreeWeekly.indexOf(user)) {
                                0 => 2,
                                2 => 3,
                                _ => 1,
                              }))
                          .toList(),
                    ),
                    const SizedBox(height: 20), // Add spacing between sections

                    // PodiumItem2 section
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      width: double.infinity,
                      child: Column(
                        children: topFourOnwards
                            .map((user) => Column(
                                  children: [
                                    PodiumItem2(
                                      name: user.name,
                                      weeklyEarned: user.weeklyEarned,
                                      username: user.username,
                                      rank: topFourOnwards.indexOf(user) + 1,
                                      isUp: user.isUp,
                                    ),
                                    if (topFourOnwards.indexOf(user) !=
                                        topFourOnwards.length - 1)
                                      const Divider(color: Colors.black12),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
