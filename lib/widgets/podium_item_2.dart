import 'package:flutter/material.dart';

class PodiumItem2 extends StatelessWidget {
  final String name;
  final double weeklyEarned;
  final String username;
  final bool? isUp;
  final int rank;

  const PodiumItem2({
    super.key,
    required this.name,
    required this.weeklyEarned,
    required this.username,
    required this.rank,
    this.isUp,
  });

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
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
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
              Row(
                children: [
                  Text(
                    '\$${weeklyEarned.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    isUp == null
                        ? Icons.remove
                        : isUp!
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                    color: isUp == null
                        ? Colors.grey
                        : isUp!
                            ? Colors.green
                            : Colors.red,
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
