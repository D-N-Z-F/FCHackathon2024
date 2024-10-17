import 'package:fc_hackathon_2024/data/model/area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateProvider<bool>((ref) => false);
final loadingProvider = StateProvider<bool>((ref) => false);
final rememberMeProvider = StateProvider<bool>((ref) => false);

final selectedAreasProvider = StateProvider<List<Area>>((ref) => []);
