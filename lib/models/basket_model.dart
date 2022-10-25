import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/models.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;

  Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
  });

  @override
  List<Object?> get props => [
        items,
        cutlery,
      ];
}
