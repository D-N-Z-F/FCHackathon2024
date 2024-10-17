import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(10), child: Text(('STAN IS GAY'))),
    );
  }
}
