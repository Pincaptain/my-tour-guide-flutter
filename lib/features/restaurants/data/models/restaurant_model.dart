import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_tour_guide/features/restaurants/data/models/location_model.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends Equatable {
  RestaurantModel(this.id, this.name, this.locationModel);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);

  final String id;
  final String name;

  @override
  List<Object> get props => [
    id,
    name,
    locationModel,
  ];

  @JsonKey(name: 'location')
  final LocationModel locationModel;

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}