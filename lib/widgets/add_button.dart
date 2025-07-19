import 'package:balanced_meal/provider/added_provider.dart';
import 'package:balanced_meal/provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButtonn extends ConsumerStatefulWidget {
  final double calories;
  final double price;
  final String foodName;

  const AddButtonn({
    super.key,
    required this.calories,
    required this.price,
    required this.foodName,
  });

  @override
  ConsumerState<AddButtonn> createState() => _AddButtonnState();
}

class _AddButtonnState extends ConsumerState<AddButtonn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: 65.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: Color(0xffF25700),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {
            ref
                .watch(addMinusCalProvider.notifier)
                .addMinusCal(widget.calories, "Add");
            ref
                .watch(addMinusPriceProvider.notifier)
                .addMinusPrice(widget.price, "Add");

            ref
                .read(OrderListProvider.notifier)
                .OrderList(widget.foodName, true);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
