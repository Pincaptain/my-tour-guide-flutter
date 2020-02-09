import 'package:equatable/equatable.dart';
import 'package:my_tour_guide/features/restaurants/data/models/restaurant_model.dart';

import 'package:my_tour_guide/features/restaurants/domain/entities/location.dart';

class Restaurant extends Equatable {
  Restaurant(this.id, this.name, this.location);

  factory Restaurant.fromModel(RestaurantModel restaurantModel) {
    return Restaurant(
      restaurantModel.id,
      restaurantModel.name,
      Location.fromModel(restaurantModel.locationModel),
    );
  }

  final String id;
  final Location location;
  final String name;

  @override
  List<Object> get props => [
    id,
    name,
    location
  ];
}