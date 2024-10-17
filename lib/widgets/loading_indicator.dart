import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  const LoadingIndicator({super.key, this.color = Colors.deepOrange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: color,
      ),
    );
  }
}
