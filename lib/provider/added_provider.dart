import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMinusCalNotifier extends StateNotifier<double> {
  AddMinusCalNotifier() : super(0.0);

  void addMinusCal(double calories, String math) {
    if (math == 'Add') {
      state += calories;
    } else {
      if (state > 0.0) {
        state -= calories;
      }
    }
  }
}

final addMinusCalProvider = StateNotifierProvider((ref) {
  return AddMinusCalNotifier();
});

// -------------------Price------------

class AddMinusPriceNotifier extends StateNotifier<double> {
  AddMinusPriceNotifier() : super(0.0);

  void addMinusPrice(double price, String math) {
    if (math == 'Add') {
      state += price;
    } else {
      if (state > 0.0) {
        state -= price;
      }
    }
  }
}

final addMinusPriceProvider = StateNotifierProvider((ref) {
  return AddMinusPriceNotifier();
});
