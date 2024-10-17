import 'package:flutter/material.dart';

class PodiumItem extends StatelessWidget {
  final String name;
  final double weeklyEarned;
  final int rank;

  const PodiumItem({
    super.key,
    required this.name,
    required this.weeklyEarned,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.1,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: rank == 1 ? 120 : 90,
                width: rank == 1 ? 120 : 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: switch (rank) {
                      1 => const Color(0xffFFD700),
                      2 => const Color(0xffC0C0C0),
                      _ => const Color(0xffCD7F32),
                    },
                    width: rank == 1 ? 6 : 4,
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: rank == 1 ? 55 : 45,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: rank == 1 ? 50 : 30,
                    ),
                  ),
                ),
              ),
              if (rank == 1)
                const Positioned(
                  top: -20,
                  child: Icon(
                    Icons.emoji_events,
                    color: Colors.amber,
                    size: 40,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '\$${weeklyEarned.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
