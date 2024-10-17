import 'package:fc_hackathon_2024/data/constants.dart';
import 'package:fc_hackathon_2024/screens/auth.dart';
import 'package:fc_hackathon_2024/screens/tab_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static void showSnackbar({
    IconData icon = Icons.error,
    Color color = Colors.red,
  }) =>
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          elevation: 4.0,
          backgroundColor: Colors.red,
          content: Row(children: [Icon(icon), const Text("Invalid Info")]),
          duration: Constants.defaultLoadTime,
        ),
      );

  static final routes = GoRouter(
    initialLocation: Auth.route,
    routes: [
      GoRoute(
        path: Auth.route,
        name: Auth.routeName,
        builder: (context, state) => const Auth(),
      ),
      GoRoute(
        path: TabContainer.route,
        name: TabContainer.routeName,
        builder: (context, state) => const TabContainer(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.light(
            primary: Colors.deepOrange,
            secondary: Colors.orange.shade800,
            tertiary: Colors.amber.shade700),
      ),
    );
  }
}
