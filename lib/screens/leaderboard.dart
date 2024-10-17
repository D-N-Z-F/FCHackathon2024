import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar.new(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 40),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Podium background
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Second place
                      PodiumItem(
                        name: "Jackson",
                        points: 1847,
                        color: Colors.blueAccent,
                        backColor: Color(0xffDEDEDE),
                        rank: 2,
                        height: 170.0,
                      ),
                      // First place
                      PodiumItem(
                        name: "Eiden",
                        points: 2430,
                        color: Colors.orangeAccent,
                        rank: 1,
                        backColor: Color(0xffCCCCCC),
                        height: 200.0,
                        isCrowned: true,
                      ),
                      // Third place
                      PodiumItem(
                        name: "Emma Aria",
                        points: 1674,
                        color: Colors.greenAccent,
                        backColor: Color(0xffDEDEDE),
                        rank: 3,
                        height: 150.0,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class PodiumItem extends StatelessWidget {
  final String name;
  final int points;
  final Color color;
  final int rank;
  final double height;
  final Color backColor;
  final bool isCrowned;

  const PodiumItem({
    Key? key,
    required this.name,
    required this.points,
    required this.color,
    required this.rank,
    required this.height,
    required this.backColor,
    this.isCrowned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0), // Adds padding to the sides
      child: Column(
        children: [
          Container(
            height: height,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: _getBorderRadius(rank),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile picture and crown
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      // Profile picture
                      backgroundColor: color.withOpacity(0.4),
                    ),
                    if (isCrowned)
                      Positioned(
                        top: -10,
                        child: Icon(Icons.emoji_events,
                            color: Colors.amber, size: 30),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                // User info inside the box
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$points',
                  style: TextStyle(
                      fontSize: 14, color: color, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "@username",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Rank number
          Text(
            '$rank',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius _getBorderRadius(int rank) {
    switch (rank) {
      case 1: // First place, fully rounded top corners
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        );
      case 2: // Second place, medium rounded top corners
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        );
      case 3: // Third place, slightly rounded top corners
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        );
      default: // Default case, no rounding
        return BorderRadius.zero;
    }
  }
}
