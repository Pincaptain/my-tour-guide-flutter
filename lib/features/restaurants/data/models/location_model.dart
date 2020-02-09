import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable {
  LocationModel(this.address, this.locality, this.city, this.zipcode);

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  final String address;
  final String city;
  final String locality;
  final String zipcode;

  @override
  List<Object> get props => [
    address,
    locality,
    city,
    zipcode,
  ];

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}