// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_tour_guide/features/restaurants/data/providers/restaurant_providers.dart';
import 'package:my_tour_guide/features/restaurants/data/repositories/restaurant_repository.dart';
import 'package:my_tour_guide/features/restaurants/domain/repositories/restaurant_repository.dart';
import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<RestaurantApiProvider>(() => RestaurantApiProvider())
    ..registerFactory<RestaurantRepository>(
        () => RestaurantRepository(getIt<IRestaurantProvider>()))
    ..registerFactory<RestaurantBloc>(
        () => RestaurantBloc(getIt<IRestaurantRepository>()));
  if (environment == 'development') {
    _registerDevelopmentDependencies();
  }
}

void _registerDevelopmentDependencies() {
  getIt
    ..registerFactory<IRestaurantProvider>(() => RestaurantApiProvider())
    ..registerFactory<IRestaurantRepository>(
        () => RestaurantRepository(getIt<IRestaurantProvider>()));
}
