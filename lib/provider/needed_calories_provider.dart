import 'package:flutter_riverpod/flutter_riverpod.dart';

class NeededCaloriesNotifier extends StateNotifier<num> {
  NeededCaloriesNotifier() : super(0.0);

  void neededCalories(String gender, int age, double weight, double height) {
    if (gender == 'Male') {
      state = ((655.1) + (9.56 * weight) + (1.85 * height) - (4.67 * age))
          .round();
    } else {
      state = ((666.47) + (13.75 * weight) + (5 * height) - (6.75 * age))
          .round();
    }
  }
}

final neededCaloriesProvider = StateNotifierProvider((ref) {
  return NeededCaloriesNotifier();
});
