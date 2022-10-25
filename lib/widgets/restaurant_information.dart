import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/restaurant_tags.dart';
import '../models/models.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(height: 5),
          Text(
            '${restaurant.distance}km await - \$${restaurant.deliveryFee} delivery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 5),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
