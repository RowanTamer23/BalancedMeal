import 'package:balanced_meal/provider/firebase_data_provider.dart';
import 'package:riverpod/riverpod.dart';

class OrderListNotifier extends StateNotifier<List<FoodItem>> {
  OrderListNotifier() : super([]);

  void OrderList(FoodItem foodItem, bool add) {
    if (add) {
      state = [...state, foodItem];
    } else {
      final list = [...state];
      final index = list.indexWhere(
        (item) =>
            item.foodName == foodItem.foodName &&
            item.collectionName == foodItem.collectionName,
      );
      if (index != -1) {
        list.removeAt(index);
      }
      state = list;
    }
  }

  void clearList() {
    state = [];
  }
}

final OrderListProvider =
    StateNotifierProvider<OrderListNotifier, List<FoodItem>>((ref) {
      return OrderListNotifier();
    });
