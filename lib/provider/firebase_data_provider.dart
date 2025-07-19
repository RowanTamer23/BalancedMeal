import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

class FoodItem {
  final String id;
  final String foodName;
  final double calories;
  final double price;
  final String imageUrl;
  final String collectionName;

  FoodItem({
    required this.id,
    required this.foodName,
    required this.calories,
    required this.price,
    required this.imageUrl,
    required this.collectionName,
  });

  factory FoodItem.fromFirestore(DocumentSnapshot doc, String collectionName) {
    final data = doc.data() as Map<String, dynamic>;
    return FoodItem(
      id: doc.id,
      foodName: data['food_name'] ?? '',
      calories: (data['calories'] as num?)?.toDouble() ?? 0.0,
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: data['image'] ?? '',
      collectionName: collectionName,
    );
  }
}

class FirebaseDataNotifier extends StateNotifier<List<FoodItem>> {
  FirebaseDataNotifier() : super([]);

  // Fetch all food items from a specific collection
  Future<void> fetchFoodItems(String collectionName) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .get();

      final foodItems = querySnapshot.docs
          .map((doc) => FoodItem.fromFirestore(doc, collectionName))
          .toList();

      state = foodItems;
    } catch (e) {
      print('Error fetching food items: $e');
      state = [];
    }
  }

  // Get a specific food item by ID and collection
  Future<FoodItem?> getFoodItemById(String id, String collectionName) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .get();

      if (doc.exists) {
        return FoodItem.fromFirestore(doc, collectionName);
      }
      return null;
    } catch (e) {
      print('Error fetching food item: $e');
      return null;
    }
  }

  // Stream food items from a collection
  Stream<List<FoodItem>> streamFoodItems(String collectionName) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FoodItem.fromFirestore(doc, collectionName))
              .toList(),
        );
  }

  // Search food items by name
  Future<void> searchFoodItems(String collectionName, String searchTerm) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('food_name', isGreaterThanOrEqualTo: searchTerm)
          .where('food_name', isLessThan: searchTerm + '\uf8ff')
          .get();

      final foodItems = querySnapshot.docs
          .map((doc) => FoodItem.fromFirestore(doc, collectionName))
          .toList();

      state = foodItems;
    } catch (e) {
      print('Error searching food items: $e');
      state = [];
    }
  }

  // Clear the current state
  void clearData() {
    state = [];
  }
}

final FirebaseDataProvider =
    StateNotifierProvider<FirebaseDataNotifier, List<FoodItem>>((ref) {
      return FirebaseDataNotifier();
    });

// Provider for streaming food items
final StreamFoodItemsProvider = StreamProvider.family<List<FoodItem>, String>((
  ref,
  collectionName,
) {
  return FirebaseFirestore.instance
      .collection(collectionName)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => FoodItem.fromFirestore(doc, collectionName))
            .toList(),
      );
});

// Provider for streaming food items from multiple collections
final StreamAllFoodItemsProvider = StreamProvider<List<FoodItem>>((ref) async* {
  final collections = [
    'vegetables',
    'fruits',
    'proteins',
    'grains',
  ]; // Add all your collections here

  List<FoodItem> allItems = [];

  for (String collectionName in collections) {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .get();

      final items = snapshot.docs
          .map((doc) => FoodItem.fromFirestore(doc, collectionName))
          .toList();

      allItems.addAll(items);
    } catch (e) {
      print('Error fetching from $collectionName: $e');
    }
  }

  yield allItems;
});
