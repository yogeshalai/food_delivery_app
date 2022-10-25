import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';

class VoucharScreen extends StatelessWidget {
  const VoucharScreen({Key? key}) : super(key: key);

  static const String routeName = '/vouchar-screen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VoucharScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, LocationScreen.routeName);
        },
        child: const Text('Location'),
      ),
    );
  }
}
