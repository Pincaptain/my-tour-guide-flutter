import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:my_tour_guide/features/restaurants/data/models/restaurant_model.dart';
import 'package:my_tour_guide/features/restaurants/data/models/restaurant_response_model.dart';

@Bind.toType(RestaurantApiProvider, env: Environment.development)
@injectable
abstract class IRestaurantProvider {
  Future<List<RestaurantModel>> getRestaurants();
}

@injectable
class RestaurantApiProvider implements IRestaurantProvider {
  final providerToken = 'f2f1f3e03f4d9eafcd695ea4f4ac4148';
  final provider = 'https://developers.zomato.com/api/v2.1/search';

  Future<List<RestaurantModel>> getRestaurants() async {
    var response = await http.get(
      Uri.encodeFull(provider),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        'user-key': providerToken,
      },
    );

    switch(response.statusCode) {
      case 200:
        var jsonString = utf8.decode(response.bodyBytes);
        var jsonData = json.decode(jsonString);
        var restaurantResponse = RestaurantResponseModel.fromJson(jsonData);
        var restaurants = Stream.fromIterable(restaurantResponse.restaurants)
          .map((value) => RestaurantModel.fromJson(value['restaurant']))
          .toList();

        return restaurants;

      default:
        throw RestaurantException();
    }
  }
}

class RestaurantException implements Exception {}