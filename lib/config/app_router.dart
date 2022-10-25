import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('The Route is: ${settings.name}');
    }
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
          restaurant: settings.arguments as Restaurant,
        );
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
          restaurants: settings.arguments as List<Restaurant>
        );
      case VoucharScreen.routeName:
        return VoucharScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong...!'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
