import 'package:balanced_meal/widgets/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryCard extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final double calories;
  final double price;
  final int count;

  const SummaryCard(
    this.count, {
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.calories,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodName),
                  Text('${calories.toStringAsFixed(0)} cal'),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' ${price.toStringAsFixed(2)}'),
              CounterButton(price: price, calories: calories),
            ],
          ),
        ],
      ),
    );
  }
}
