import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends StatefulWidget {
  @override
  State<CounterButton> createState() {
    return _CounterButtonState();
  }
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40.w,

              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: Color(0xffF25700),
                  size: 26,
                ),
              ),
            ),
            // ),
            Text('2'),
            Container(
              width: 40.w,
              child: IconButton(
                onPressed: () {},
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
