import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/models.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;

  const Filter({this.categoryFilters = const [], this.priceFilters = const []});

  Filter copyWith({
    List<CategoryFilter>? categoryFilters,
    List<PriceFilter>? priceFilters,
  }) {
    return Filter(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      priceFilters: priceFilters ?? this.priceFilters,
    );
  }

  @override
  List<Object?> get props => [categoryFilters, priceFilters];
}
