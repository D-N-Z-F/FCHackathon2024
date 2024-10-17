import 'package:fc_hackathon_2024/screens/tab_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final routes = GoRouter(
    initialLocation: TabContainer.route,
    routes: [
      GoRoute(
        path: TabContainer.route,
        name: TabContainer.routeName,
        builder: (context, state) => const TabContainer(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routes);
  }
}
