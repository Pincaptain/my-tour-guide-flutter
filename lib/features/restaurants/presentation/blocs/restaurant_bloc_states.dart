import 'package:flutter/material.dart';

import 'package:my_tour_guide/features/restaurants/domain/entities/restaurant.dart';

abstract class RestaurantState {}

class RestaurantInitialState extends RestaurantState {}

class RestaurantLoadingState extends RestaurantState {}

class RestaurantLoadedState extends RestaurantState {
  final List<Restaurant> restaurants;

  RestaurantLoadedState({
    @required this.restaurants,
  });
}

class RestaurantErrorState extends RestaurantState {
  final String errorMessage;

  RestaurantErrorState({
    @required this.errorMessage,
  });
}