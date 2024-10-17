import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isPortrait
          ? Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 5, right: 5, top: isPortrait ? 50 : 30),
              child: Column(
                children: [
                  // Top podium row for the top 3 players
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PodiumItem(
                        name: "Vatani",
                        points: 1932,
                        color: Colors.blueAccent, // Avatar color
                        backColor: Color(0xffC0C0C0), // Silver for 2nd place
                        rank: 2,
                      ),
                      PodiumItem(
                        name: "Iman",
                        points: 3459,
                        color: Colors.orangeAccent, // Avatar color
                        backColor: Color(0xffFFD700), // Gold for 1st place
                        rank: 1,
                        isCrowned: true, // Display crown for first place
                      ),
                      PodiumItem(
                        name: "Jonathan",
                        points: 1431,
                        color: Colors.orange, // Avatar color
                        backColor: Color(0xffCD7F32), // Bronze for 3rd place
                        rank: 3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing between sections

                  // Expanded widget allows the scroll view to take up remaining space
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: double.infinity,
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            PodiumItem2(
                              name: "Sebastian",
                              points: 1124,
                              username: "username",
                              rank: 1,
                              isUp: true,
                            ),
                            Divider(
                              color: Colors.black12,
                            ),
                            PodiumItem2(
                              name: "Logan",
                              points: 875,
                              username: "username",
                              rank: 2,
                              isUp: false,
                            ),
                            Divider(
                              color: Colors.black12,
                            ),
                            PodiumItem2(
                              name: "Natalie",
                              points: 774,
                              username: "username",
                              rank: 3,
                              isUp: true,
                            ),
                            Divider(
                              color: Colors.black12,
                            ),
                            PodiumItem2(
                              name: "Serenity",
                              points: 723,
                              username: "username",
                              rank: 4,
                              isUp: true,
                            ),
                            Divider(
                              color: Colors.black12,
                            ),
                            PodiumItem2(
                              name: "Hannah",
                              points: 559,
                              username: "username",
                              rank: 5,
                              isUp: false,
                            ),
                          ],
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
                    // Top podium row for the top 3 players
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Second place
                        PodiumItem(
                          name: "Vatani",
                          points: 1932,
                          color: Colors.blueAccent, // Avatar color
                          backColor: Color(0xffC0C0C0), // Silver for 2nd place
                          rank: 2,
                        ),
                        // First place
                        PodiumItem(
                          name: "Iman",
                          points: 3459,
                          color: Colors.orangeAccent, // Avatar color
                          backColor: Color(0xffFFD700), // Gold for 1st place
                          rank: 1,
                          isCrowned: true, // Display crown for first place
                        ),
                        // Third place
                        PodiumItem(
                          name: "Jonathan",
                          points: 1431,
                          color: Colors.orange, // Avatar color
                          backColor: Color(0xffCD7F32), // Bronze for 3rd place
                          rank: 3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Add spacing between sections

                    // PodiumItem2 section
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: double.infinity,
                      child: const Column(
                        children: const [
                          PodiumItem2(
                            name: "Sebastian",
                            points: 1124,
                            username: "username",
                            rank: 1,
                            isUp: true,
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          PodiumItem2(
                            name: "Logan",
                            points: 875,
                            username: "username",
                            rank: 2,
                            isUp: false,
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          PodiumItem2(
                            name: "Natalie",
                            points: 774,
                            username: "username",
                            rank: 3,
                            isUp: true,
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          PodiumItem2(
                            name: "Serenity",
                            points: 723,
                            username: "username",
                            rank: 4,
                            isUp: true,
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          PodiumItem2(
                            name: "Hannah",
                            points: 559,
                            username: "username",
                            rank: 5,
                            isUp: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class PodiumItem extends StatelessWidget {
  final String name;
  final int points;
  final Color color;
  final int rank;
  final Color backColor;
  final bool isCrowned;

  const PodiumItem({
    super.key,
    required this.name,
    required this.points,
    required this.color,
    required this.rank,
    required this.backColor,
    this.isCrowned = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (isCrowned)
            const Positioned(
              top: -20,
              child: Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 40,
              ),
            ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Circle with border
              Container(
                height: rank == 1 ? 120 : 90, // Larger for 1st place
                width: rank == 1 ? 120 : 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: backColor, // Gold, silver, or bronze
                    width: rank == 1 ? 6 : 4, // Thicker for 1st place
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: rank == 1 ? 55 : 45, // Smaller inner circle
                    backgroundColor: Colors.grey[200], // Transparent center
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: rank == 1 ? 50 : 30, // Icon size depends on rank
                    ),
                  ),
                ),
              ),
              // Display crown for first place
            ],
          ),
          const SizedBox(height: 8),
          // Name and level text
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '$points points',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class PodiumItem2 extends StatelessWidget {
  final String name;
  final int points;
  final String username;
  final bool isUp; // To show if the user moved up or down in rank
  final Color color; // Background color for avatar and rank
  final int rank;

  const PodiumItem2({
    Key? key,
    required this.name,
    required this.points,
    required this.username,
    required this.rank,
    this.isUp = true,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Circle avatar
                  const CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30, // Icon size depends on rank
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Name and username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '@$username',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Points and rank change arrow
              Row(
                children: [
                  Text(
                    '$points',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: isUp ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
