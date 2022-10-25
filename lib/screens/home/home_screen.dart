import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';
import 'package:food_delivery_app/widgets/widgtets.dart';

import 'package:location/location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(category: Category.categories[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(
                      promo: Promo.promos[index],
                    );
                  },
                ),
              ),
            ),
            const FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Restaurant.restaurants.length,
              itemBuilder: ((context, index) {
                return RestaurantCard(
                    restaurant: Restaurant.restaurants[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future _initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    var loc = await location.getLocation();
    print("${loc.latitude} ${loc.longitude}");
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CURRENT LOCATION',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              'Nashik, 12 Yogi Street',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
