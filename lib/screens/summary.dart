import 'package:balanced_meal/provider/firebase_data_provider.dart';
import 'package:balanced_meal/provider/list_provider.dart';
import 'package:balanced_meal/widgets/bottom_widget.dart';
import 'package:balanced_meal/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends ConsumerStatefulWidget {
  // final String collection;

  const Summary({
    // required this.collection,
    super.key,
  });

  @override
  ConsumerState<Summary> createState() => _SummaryState();
}

class _SummaryState extends ConsumerState<Summary> {
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(OrderListProvider);
    final allFoodItemsAsync = ref.watch(StreamAllFoodItemsProvider);

    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        title: Text(
          'Create your order',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allFoodItemsAsync.when(
                        data: (allFoodItems) {
                          // Get unique food items from order list
                          final uniqueFoodItems = <String, FoodItem>{};
                          final itemCounts = <String, int>{};

                          for (final orderItem in orderList) {
                            final key =
                                '${orderItem.foodName}_${orderItem.collectionName}';
                            uniqueFoodItems[key] = orderItem;
                            itemCounts[key] = (itemCounts[key] ?? 0) + 1;
                          }

                          // Create summary items with counts
                          final summaryItems = uniqueFoodItems.entries.map((
                            entry,
                          ) {
                            final foodItem = entry.value;
                            final count = itemCounts[entry.key]!;
                            return {'item': foodItem, 'count': count};
                          }).toList();

                          return Column(
                            children: summaryItems.map((itemData) {
                              final foodItem = itemData['item'] as FoodItem;
                              final count = itemData['count'] as int;
                              return SummaryCardWid(count, foodItem: foodItem);
                            }).toList(),
                          );
                        },
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                      ),
                      Container(height: 130.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomWidget(btnTxt: 'Place Order', calories: 20, price: 12),
        ],
      ),
    );
  }
}
