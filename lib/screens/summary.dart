import 'package:balanced_meal/widgets/bottom_widget.dart';
import 'package:balanced_meal/widgets/summary_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  // Example: Replace with your actual selected items logic
  final List<Map<String, String>> selectedItems = [
    {'collection': 'vegetables', 'id': 'docId1'},
    {'collection': 'meat', 'id': 'docId2'},
    {'collection': 'carbs', 'id': 'docId3'},
  ];

  @override
  Widget build(BuildContext context) {
    int count;
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        title: Text(
          'Create your order',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...selectedItems.map((item) {
                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection(item['collection']!)
                              .doc(item['id']!)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (!snapshot.hasData || !snapshot.data!.exists) {
                              return SizedBox(); // or show an error
                            }
                            final data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return SummaryCard(
                              price: (data['price'] as num?)?.toDouble() ?? 0.0,
                              calories:
                                  (data['calories'] as num?)?.toDouble() ?? 0.0,
                              imageUrl: data['image'] ?? '',
                              foodName: data['food_name'] ?? '',
                              count = 1,
                            );
                          },
                        );
                      }).toList(),
                      Container(height: 130.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomWidget(btnTxt: 'Place Order', calories: 20, price: 12),
        ],
      ),
    );
  }
}
