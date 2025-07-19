import 'package:balanced_meal/provider/firebase_data_provider.dart';
import 'package:balanced_meal/provider/list_provider.dart';
import 'package:balanced_meal/widgets/add_button.dart';
import 'package:balanced_meal/widgets/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWid extends ConsumerStatefulWidget {
  final String itemId;
  final String collectionName;

  const CardWid({
    super.key,
    required this.itemId,
    required this.collectionName,
  });

  @override
  ConsumerState<CardWid> createState() => _CardWidState();
}

class _CardWidState extends ConsumerState<CardWid> {
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(OrderListProvider);
    final foodItemsAsync = ref.watch(
      StreamFoodItemsProvider(widget.collectionName),
    );

    return foodItemsAsync.when(
      data: (foodItems) {
        final foodItem = foodItems.firstWhere(
          (item) => item.id == widget.itemId,
          orElse: () => FoodItem(
            id: '',
            foodName: 'Not Found',
            calories: 0.0,
            price: 0.0,
            imageUrl: '',
            collectionName: '',
          ),
        );

        int counted = orderList
            .where(
              (item) =>
                  item.foodName == foodItem.foodName &&
                  item.collectionName == foodItem.collectionName,
            )
            .length;
        bool isAdded = counted > 0;

        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffEAECF0)),
          ),
          width: 200,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (foodItem.imageUrl.isNotEmpty)
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(foodItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 30),
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      foodItem.foodName,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${foodItem.calories.toStringAsFixed(0)} cal',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xff959595),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45.w,
                      child: Text(
                        '\$${foodItem.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xffF25700),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    isAdded
                        ? CounterButton(foodItem: foodItem)
                        : AddButtonn(foodItem: foodItem),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        width: 200,
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        width: 200,
        height: 200,
        child: Center(child: Text('Error: $error')),
      ),
    );
  }
}
