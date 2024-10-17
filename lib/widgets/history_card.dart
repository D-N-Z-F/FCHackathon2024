import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final bool isFailed;
  const HistoryCard({
    super.key,
    required this.taskName,
    this.isCompleted = false,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(taskName),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              isFailed
                  ? "Failed"
                  : isCompleted
                      ? "Completed"
                      : "Ongoing",
              style: TextStyle(
                color: isFailed
                    ? Colors.red
                    : isCompleted
                        ? Colors.green
                        : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
