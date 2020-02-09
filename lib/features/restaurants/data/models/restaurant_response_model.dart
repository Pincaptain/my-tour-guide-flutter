import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response_model.g.dart';

@JsonSerializable()
class RestaurantResponseModel extends Equatable {
  RestaurantResponseModel(this.results, this.shown, this.restaurants);

  factory RestaurantResponseModel.fromJson(Map<String, dynamic> json) => _$RestaurantResponseModelFromJson(json);

  final List<Map<String, dynamic>> restaurants;

  @override
  List<Object> get props => [
    results,
    shown,
    restaurants,
  ];

  @JsonKey(name: 'results_found')
  final int results;

  @JsonKey(name: 'results_shown')
  final int shown;

  Map<String, dynamic> toJson() => _$RestaurantResponseModelToJson(this);
}