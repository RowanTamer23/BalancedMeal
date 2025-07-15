import 'package:balanced_meal/core/routing/routes.dart';
import 'package:balanced_meal/screens/create_your_order.dart';
import 'package:balanced_meal/screens/enter_your_details.dart';
import 'package:balanced_meal/screens/summary.dart';
import 'package:balanced_meal/screens/welcome.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());

      case Routes.details:
        return MaterialPageRoute(builder: (_) => Enteryourdetails());

      case Routes.order:
        return MaterialPageRoute(builder: (_) => CreateYourOrder());

      case Routes.summary:
        return MaterialPageRoute(builder: (_) => Summary());

      default:
        // Unknown route
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
