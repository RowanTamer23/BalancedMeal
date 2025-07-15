import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardWid extends StatelessWidget {
  final String itemId;
  final String collectionName;

  const CardWid({
    super.key,
    required this.itemId,
    required this.collectionName,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection(collectionName)
          .doc(itemId)
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
        final foodName = data['food_name'] as String?;
        final calories = data['calories']?.toDouble() ?? 0.0;
        final price = data['price']?.toDouble() ?? 0.0;

        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffEAECF0)),
          ),
          width: 200,
          height: 180,
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
                      foodName ?? 'Loading...',
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
              Spacer(),
              Container(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
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
              ),
            ],
          ),
        );
      },
    );
  }
}
