import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tour_guide/features/restaurants/data/providers/restaurant_providers.dart';
import 'package:my_tour_guide/features/restaurants/domain/repositories/restaurant_repository.dart';

import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc_events.dart';
import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc_states.dart';

@injectable
class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc(this.restaurantRepository);

  IRestaurantRepository restaurantRepository;

  @override
  RestaurantState get initialState => RestaurantInitialState();

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    yield RestaurantLoadingState();

    try {
      var restaurants = await restaurantRepository.getRestaurants();

      yield RestaurantLoadedState(
        restaurants: restaurants,
      );
    } on RestaurantException {
      yield RestaurantErrorState(
        errorMessage: 'Cannot get restaurants at the moment. Please try again!'
      );
    }
  }
}