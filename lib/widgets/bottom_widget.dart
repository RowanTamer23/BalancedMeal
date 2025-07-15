import 'package:balanced_meal/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWidget extends StatefulWidget {
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
  State<BottomWidget> createState() {
    return _BottomWidgetState();
  }
}

class _BottomWidgetState extends State<BottomWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
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
                '${widget.calories.toString()} Cal out of ${widget.calories.toString()} Cal',
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
                '\$${widget.price.toString()}',
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
                Navigator.pushNamed(context, Routes.summary);
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
