// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    json['address'] as String,
    json['locality'] as String,
    json['city'] as String,
    json['zipcode'] as String,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'locality': instance.locality,
      'zipcode': instance.zipcode,
    };
