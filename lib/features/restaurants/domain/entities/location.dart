import 'package:equatable/equatable.dart';

import 'package:my_tour_guide/features/restaurants/data/models/location_model.dart';

class Location extends Equatable {
  Location(this.address, this.locality, this.city, this.zipcode);

  factory Location.fromModel(LocationModel locationModel) {
    return Location(
      locationModel.address,
      locationModel.city,
      locationModel.locality,
      locationModel.zipcode,
    );
  }

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
}