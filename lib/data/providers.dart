import 'package:fc_hackathon_2024/data/model/area.dart';
import 'package:fc_hackathon_2024/data/model/shift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateProvider<bool>((ref) => false);
final loadingProvider = StateProvider<bool>((ref) => false);
final rememberMeProvider = StateProvider<bool>((ref) => false);
final shiftsProvider = StateProvider<List<Shift>>(
  (ref) => [
    Shift(duration: "6 PM - 10 PM"),
    Shift(duration: "10 PM - 2 AM"),
    Shift(duration: "2 AM - 6 AM"),
  ],
);
final areasProvider = StateProvider<List<Area>>(
  (ref) =>
      [for (var i = 0; i < 9; i++) Area(code: "A$i")] +
      [for (var i = 0; i < 9; i++) Area(code: "B$i")],
);
final selectedAreasProvider = StateProvider<List<Area>>((ref) => []);
