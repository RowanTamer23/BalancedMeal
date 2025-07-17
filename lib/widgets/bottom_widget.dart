import 'package:balanced_meal/core/routing/routes.dart';
import 'package:balanced_meal/provider/added_provider.dart';
import 'package:balanced_meal/provider/needed_calories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWidget extends ConsumerStatefulWidget {
  const BottomWidget({
    super.key,
    required this.calories,
    required this.btnTxt,
    required this.price,
  });
  final double calories;
  final double price;
  final String btnTxt;

  @override
  ConsumerState<BottomWidget> createState() {
    return _BottomWidgetState();
  }
}

class _BottomWidgetState extends ConsumerState<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    final NeededCalories = ref.watch(NeededCaloriesProvider);
    final addminusCal = ref.watch(addMinusCalProvider);
    final addMinusPrice = ref.watch(addMinusPriceProvider);

    final isActiveProvider = Provider<bool>((ref) {
      final neededCalories = ref.watch(NeededCaloriesProvider);
      final addMinusCal = ref.watch(addMinusCalProvider);
      return addMinusCal >= 0.9 * neededCalories &&
          addMinusCal <= 1.1 * neededCalories;
    });
    bool isActive = ref.watch(isActiveProvider);

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(20),
      width: 375.w,
      height: 190.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cal',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              Text(
                ' ${addminusCal} Cal out of ${NeededCalories} Cal',
                style: TextStyle(fontSize: 14, color: Color(0xff959595)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              Text(
                '\$ ${addMinusPrice}',
                style: TextStyle(fontSize: 16, color: Color(0xffF25700)),
              ),
            ],
          ),
          Container(
            height: 60.h,
            width: 327.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              color: isActive ? Color(0xffF25700) : Color(0xffEAECF0),
            ),
            child: TextButton(
              onPressed: () {
                isActive ? Navigator.pushNamed(context, Routes.summary) : null;
              },
              child: Text(
                widget.btnTxt,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Container(height: 20.h),
        ],
      ),
    );
  }
}
