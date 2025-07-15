import 'package:balanced_meal/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateYourOrder extends StatefulWidget {
  const CreateYourOrder({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateYourOrderState();
  }
}

class _CreateYourOrderState extends State<CreateYourOrder> {
  // Sample static data for vegetables
  // final List<Map<String, dynamic>> vegetables = [
  //   {
  //     'name': 'Broccoli',
  //     'calories': 55,
  //     'price': 3.50,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=200',
  //   },
  //   {
  //     'name': 'Spinach',
  //     'calories': 23,
  //     'price': 2.75,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=200',
  //   },
  //   {
  //     'name': 'Carrots',
  //     'calories': 41,
  //     'price': 2.25,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1447175008436-170170d87133?w=200',
  //   },
  //   {
  //     'name': 'Bell Peppers',
  //     'calories': 31,
  //     'price': 3.00,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?w=200',
  //   },
  //   {
  //     'name': 'Cauliflower',
  //     'calories': 25,
  //     'price': 2.50,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1568584711075-3d021a7c3caa?w=200',
  //   },
  // ];

  // Sample static data for meats
  // final List<Map<String, dynamic>> meats = [
  //   {
  //     'name': 'Chicken Breast',
  //     'calories': 165,
  //     'price': 8.50,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=200',
  //   },
  //   {
  //     'name': 'Salmon',
  //     'calories': 208,
  //     'price': 12.75,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=200',
  //   },
  //   {
  //     'name': 'Beef Steak',
  //     'calories': 250,
  //     'price': 15.00,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=200',
  //   },
  //   {
  //     'name': 'Turkey',
  //     'calories': 135,
  //     'price': 7.25,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=200',
  //   },
  //   {
  //     'name': 'Pork Chops',
  //     'calories': 231,
  //     'price': 9.50,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=200',
  //   },
  // ];

  // Sample static data for carbs
  // final List<Map<String, dynamic>> carbs = [
  //   {
  //     'name': 'Brown Rice',
  //     'calories': 111,
  //     'price': 3.25,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200',
  //   },
  //   {
  //     'name': 'Quinoa',
  //     'calories': 120,
  //     'price': 4.50,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200',
  //   },
  //   {
  //     'name': 'Sweet Potato',
  //     'calories': 103,
  //     'price': 2.75,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1596097635121-14b63b7a0c19?w=200',
  //   },
  //   {
  //     'name': 'Oats',
  //     'calories': 68,
  //     'price': 2.00,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1612507093780-705a6b1c0c2c?w=200',
  //   },
  //   {
  //     'name': 'Whole Wheat Bread',
  //     'calories': 69,
  //     'price': 3.75,
  //     'imageUrl':
  //         'https://images.unsplash.com/photo-1509446636875-bf3c685cb5b5?w=200',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vegetables',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 10, 30),
                      height: 200.h,
                      width: 373.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: vegetables.length,
                        itemBuilder: (context, index) {
                          // final data = vegetables[index];
                          return CardWid(
                            // itemName: data['name'] ?? 'Unknown',
                            // calories: data['calories'] ?? 0,
                            // price: (data['price'] ?? 0.0).toDouble(),
                            // imageUrl: data['imageUrl'],
                          );
                        },
                      ),
                    ),

                    Text(
                      'Meats',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 10, 30),
                      height: 200.h,
                      width: 373.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: meats.length,
                        itemBuilder: (context, index) {
                          // final data = meats[index];
                          return CardWid(
                            //   itemName: data['name'] ?? 'Unknown',
                            //   calories: data['calories'] ?? 0,
                            //   price: (data['price'] ?? 0.0).toDouble(),
                            //   imageUrl: data['imageUrl'],
                          );
                        },
                      ),
                    ),
                    Text(
                      'Carbs',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 10, 30),
                      height: 200.h,
                      width: 373.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: carbs.length,
                        itemBuilder: (context, index) {
                          // final data = carbs[index];
                          return CardWid(
                            // itemName: data['name'] ?? 'Unknown',
                            // calories: data['calories'] ?? 0,
                            // price: (data['price'] ?? 0.0).toDouble(),
                            // imageUrl: data['imageUrl'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
