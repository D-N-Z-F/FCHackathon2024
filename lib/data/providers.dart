import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateProvider<bool>((ref) => false);
final loadingProvider = StateProvider<bool>((ref) => false);
