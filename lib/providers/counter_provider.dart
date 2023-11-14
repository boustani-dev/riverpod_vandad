import 'package:hooks_riverpod/hooks_riverpod.dart';

class counter extends StateNotifier<int?> {
  counter() : super(null);
  increment() {
    state = state == null ? 1 : state! + 1;
  }
}

final counterProvider =
    StateNotifierProvider<counter, int?>((ref) => counter());
