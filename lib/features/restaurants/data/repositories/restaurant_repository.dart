import 'package:injectable/injectable.dart';

import 'package:my_tour_guide/features/restaurants/data/providers/restaurant_providers.dart';
import 'package:my_tour_guide/features/restaurants/domain/entities/restaurant.dart';
import 'package:my_tour_guide/features/restaurants/domain/repositories/restaurant_repository.dart';

@injectable
class RestaurantRepository implements IRestaurantRepository {
  RestaurantRepository(this.restaurantProvider);

  IRestaurantProvider restaurantProvider;

  @override
  Future<List<Restaurant>> getRestaurants() async {
    var restaurants = await restaurantProvider.getRestaurants();

    return Stream.fromIterable(restaurants)
      .map((restaurantModel) => Restaurant.fromModel(restaurantModel))
      .toList();
  }
}