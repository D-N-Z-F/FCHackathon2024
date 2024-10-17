import 'package:fc_hackathon_2024/data/constants.dart';
import 'package:fc_hackathon_2024/data/model/area.dart';
import 'package:fc_hackathon_2024/data/model/shift.dart';
import 'package:fc_hackathon_2024/data/model/user.dart';
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
          tertiary: Colors.amber.shade700,
        ),
      ),
    );
  }
}

final areas = [for (var i = 0; i < 9; i++) Area(code: "A$i")] +
    [for (var i = 0; i < 9; i++) Area(code: "B$i")];

final shifts = [
  Shift(duration: "6 PM - 10 PM"),
  Shift(duration: "10 PM - 2 AM"),
  Shift(duration: "2 AM - 6 AM"),
];

final List<User> users = [
  User(
    name: "Vatani",
    username: "vatani123",
    email: "vatani@example.com",
    phoneNo: "+1234567890",
    allTimeEarned: 1932.00,
    weeklyEarned: 500.00,
    dailyEarned: 100.00,
  ),
  User(
    name: "Iman",
    username: "iman456",
    email: "iman@example.com",
    phoneNo: "+0987654321",
    allTimeEarned: 3459.00,
    weeklyEarned: 700.00,
    dailyEarned: 150.00,
  ),
  User(
    name: "Jonathan",
    username: "jonathan789",
    email: "jonathan@example.com",
    phoneNo: "+1357924680",
    allTimeEarned: 1431.00,
    weeklyEarned: 400.00,
    dailyEarned: 90.00,
  ),
  User(
    name: "Sebastian",
    username: "username",
    email: "sebastian@example.com",
    phoneNo: "+1112223333",
    allTimeEarned: 1124.00,
    weeklyEarned: 300.00,
    dailyEarned: 80.00,
    isUp: true,
  ),
  User(
    name: "Logan",
    username: "username",
    email: "logan@example.com",
    phoneNo: "+2223334444",
    allTimeEarned: 875.00,
    weeklyEarned: 200.00,
    dailyEarned: 60.00,
    isUp: false,
  ),
  User(
    name: "Natalie",
    username: "username",
    email: "natalie@example.com",
    phoneNo: "+3334445555",
    allTimeEarned: 774.00,
    weeklyEarned: 150.00,
    dailyEarned: 50.00,
    isUp: true,
  ),
  User(
    name: "Serenity",
    username: "username",
    email: "serenity@example.com",
    phoneNo: "+4445556666",
    allTimeEarned: 723.00,
    weeklyEarned: 130.00,
    dailyEarned: 45.00,
    isUp: true,
  ),
  User(
    name: "Hannah",
    username: "username",
    email: "hannah@example.com",
    phoneNo: "+5556667777",
    allTimeEarned: 559.00,
    weeklyEarned: 100.00,
    dailyEarned: 30.00,
    isUp: false,
  ),
];
