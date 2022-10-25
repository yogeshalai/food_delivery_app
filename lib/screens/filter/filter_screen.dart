import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/filter/filter_bloc.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/restaurant_listing/restaurant_listing_screen.dart';
import '../../widgets/widgtets.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FilterLoaded) {
                    return ElevatedButton(
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();
                        var prices = state.filter.priceFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where((restaurant) => categories.any((category) =>
                                restaurant.tags.contains(category)))
                            .where((restaurant) => prices.any((price) =>
                                restaurant.priceCategory.contains(price)))
                            .toList();

                        Navigator.pushNamed(
                            context, RestaurantListingScreen.routeName,
                            arguments: restaurants);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      child: const Text('Apply'),
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const CustomPriceFilter(),
              Text(
                'Category',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const CustomCategoryFilter(),
            ],
          ),
        ),
      ),
    );
  }
}
