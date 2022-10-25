import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/screens.dart';

import '../../models/models.dart';
import '../../widgets/widgtets.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  static const String routeName = '/restaurant-details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('RestaurantDetails'),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, BasketScreen.routeName);
                },
                child: Text('Basket'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurant.imageUrl),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurant.tags.length,
              itemBuilder: (context, index) {
                return _buildMenuItems(restaurant, context, index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          menuItem.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          menuItem.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${menuItem.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
