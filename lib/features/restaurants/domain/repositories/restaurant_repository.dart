import 'package:injectable/injectable.dart';
import 'package:my_tour_guide/features/restaurants/data/repositories/restaurant_repository.dart';
import 'package:my_tour_guide/features/restaurants/domain/entities/restaurant.dart';

@Bind.toType(RestaurantRepository, env: Environment.development)
@injectable
abstract class IRestaurantRepository {
  Future<List<Restaurant>> getRestaurants();
}