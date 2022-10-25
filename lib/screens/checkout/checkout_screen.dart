import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, LocationScreen.routeName);
        },
        child: const Text('Checkout'),
      ),
    );
  }
}
