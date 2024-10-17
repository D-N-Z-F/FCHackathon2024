import 'package:fc_hackathon_2024/data/constants.dart';
import 'package:fc_hackathon_2024/data/model/area.dart';
import 'package:fc_hackathon_2024/data/model/shift.dart';
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

final areas = [
  Area(areaName: 'A1'),
  Area(areaName: 'A2'),
  Area(areaName: 'A3'),
  Area(areaName: 'A4'),
  Area(areaName: 'A5'),
  Area(areaName: 'A6'),
  Area(areaName: 'A7'),
  Area(areaName: 'A8'),
  Area(areaName: 'A9'),
  Area(areaName: 'B1'),
  Area(areaName: 'B2'),
  Area(areaName: 'B3'),
  Area(areaName: 'B4'),
  Area(areaName: 'B5'),
  Area(areaName: 'B6'),
  Area(areaName: 'B7'),
  Area(areaName: 'B8'),
];

final shifts = [
  Shift(duration: "6 PM - 10 PM"),
  Shift(duration: "10 PM - 2 AM"),
  Shift(duration: "2 AM - 6 AM"),
];
