import 'package:balanced_meal/provider/list_provider.dart';
import 'package:balanced_meal/widgets/add_button.dart';
import 'package:balanced_meal/widgets/counter_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection(widget.collectionName)
          .doc(widget.itemId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('No data found'));
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final imageUrl = data['image'] as String?;
        final foodName1 = data['food_name'] as String?;
        final calories = data['calories']?.toDouble() ?? 0.0;
        final price = data['price']?.toDouble() ?? 0.0;

        bool isAdded = orderList.contains(foodName1);

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
              if (imageUrl != null)
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
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
                      foodName1 ?? 'Loading...',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${calories.toStringAsFixed(0)} cal',
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
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xffF25700),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    isAdded
                        ? CounterButton(
                            price: price,
                            calories: calories,
                            // counter: count,
                            foodName: foodName1.toString(),
                          )
                        : AddButtonn(
                            price: price,
                            calories: calories,
                            foodName: foodName1.toString(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
