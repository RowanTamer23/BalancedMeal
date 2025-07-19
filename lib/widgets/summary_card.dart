import 'package:balanced_meal/provider/firebase_data_provider.dart';
import 'package:balanced_meal/widgets/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryCardWid extends StatefulWidget {
  final FoodItem foodItem;
  final int count;

  const SummaryCardWid(this.count, {super.key, required this.foodItem});

  @override
  State<SummaryCardWid> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCardWid> {
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
                    image: NetworkImage(widget.foodItem.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.foodItem.foodName),
                  Text('${widget.foodItem.calories.toStringAsFixed(0)} cal'),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' ${widget.foodItem.price.toStringAsFixed(2)}'),
              CounterButton(foodItem: widget.foodItem),
            ],
          ),
        ],
      ),
    );
  }
}
