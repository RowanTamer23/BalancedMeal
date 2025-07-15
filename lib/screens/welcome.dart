import 'package:flutter/material.dart';

import '../core/routing/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/welcome.jpg', fit: BoxFit.cover),
          ),
          Positioned(
            top: 70,
            left: 50,
            child: Text(
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: 'Poppins',
              ),
              'Balanced Meal',
            ),
          ),
          Positioned(
            top: 559,
            left: 40,
            child: Container(
              height: 120,
              width: 327,
              alignment: Alignment.center,
              child: Text(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,

                'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
              ),
            ),
          ),
          Positioned(
            top: 709,
            left: 40,
            child: SizedBox(
              width: 327,
              height: 70,
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Color.fromARGB(255, 242, 89, 0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.details);
                },
                child: Text(
                  'Order food',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
