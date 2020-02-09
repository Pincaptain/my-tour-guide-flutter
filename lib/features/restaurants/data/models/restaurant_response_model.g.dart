// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponseModel _$RestaurantResponseModelFromJson(
    Map<String, dynamic> json) {
  return RestaurantResponseModel(
    json['results_found'] as int,
    json['results_shown'] as int,
    (json['restaurants'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantResponseModelToJson(
        RestaurantResponseModel instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
      'results_found': instance.results,
      'results_shown': instance.shown,
    };
