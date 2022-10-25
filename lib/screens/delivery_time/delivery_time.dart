import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliveryTime')),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, LocationScreen.routeName);
        },
        child: const Text('DeliveryTime'),
      ),
    );
  }
}
