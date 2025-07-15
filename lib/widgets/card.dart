import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CardWid extends StatelessWidget {
  final String? itemId;
  final String? itemName;
  final int? calories;
  final double? price;
  final String? imageUrl;

  const CardWid({
    super.key,
    this.itemId,
    this.itemName,
    this.calories,
    this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final databaseRef = FirebaseDatabase.instance.ref('https://console.firebase.google.com/project/balanced-meal-26htnc/firestore/databases/-default-/data/~2Fcarbs~2F1');
    databaseRef.once().then((DatabaseEvent event) {
      // Use event.snapshot.value
    });

    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffEAECF0)),
      ),
      width: 200,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null)
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName ?? 'Loading...',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),

              Text(
                '${calories ?? 0} cal',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xff959595),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${price?.toStringAsFixed(2) ?? '0.00'}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xffF25700),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add to cart functionality
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Color(0xffF25700),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
