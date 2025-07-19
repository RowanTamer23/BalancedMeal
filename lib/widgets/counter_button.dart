import 'package:balanced_meal/provider/added_provider.dart';
import 'package:balanced_meal/provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends ConsumerStatefulWidget {
  final double calories;
  final double price;
  // final int counter;
  final String foodName;

  const CounterButton({
    super.key,
    required this.calories,
    required this.price,
    // required this.counter,
    required this.foodName,
  });

  @override
  ConsumerState<CounterButton> createState() {
    return _CounterButtonState();
  }
}

class _CounterButtonState extends ConsumerState<CounterButton> {
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(OrderListProvider);
    int counted = orderList.where((item) => item == widget.foodName).length;

    return Center(
      child: Container(
        width: 110.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40.w,
              child: IconButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  ref
                      .watch(addMinusCalProvider.notifier)
                      .addMinusCal(widget.calories, "Add");
                  ref
                      .watch(addMinusPriceProvider.notifier)
                      .addMinusPrice(widget.price, 'Add');
                  ref
                      .read(OrderListProvider.notifier)
                      .OrderList(widget.foodName, true);
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Color(0xffF25700),
                  size: 24,
                ),
              ),
              // ),
            ),
            Text(counted.toString()),
            Container(
              width: 40.w,
              child: IconButton(
                style: ButtonStyle(
                  // elevation: MaterialStateProperty.all(0),
                  // shadowColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  // overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  ref
                      .watch(addMinusCalProvider.notifier)
                      .addMinusCal(widget.calories, "Minus");
                  ref
                      .watch(addMinusPriceProvider.notifier)
                      .addMinusPrice(widget.price, 'Minus');
                  ref
                      .read(OrderListProvider.notifier)
                      .OrderList(widget.foodName, false);
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Color(0xffF25700),
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
