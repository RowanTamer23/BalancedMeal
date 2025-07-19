import 'package:riverpod/riverpod.dart';

class OrderListNotifier extends StateNotifier<List<String>> {
  OrderListNotifier() : super([]);

  void OrderList(String foodName, bool add) {
    if (add) {
      state = [...state, foodName];
    } else {
      final list = [...state];
      final index = list.indexOf(foodName);
      if (index != -1) {
        list.removeAt(index);
      }
      state = list;
    }
  }
}

final OrderListProvider = StateNotifierProvider((ref) {
  return OrderListNotifier();
});
