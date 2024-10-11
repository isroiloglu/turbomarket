// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingCitiesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingCitiesModel _$ShippingCitiesModelFromJson(Map<String, dynamic> json) =>
    ShippingCitiesModel(
      cityId: json['city_id'] as String?,
      countryCode: json['country_code'] as String?,
      stateCode: json['state_code'] as String?,
      status: json['status'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$ShippingCitiesModelToJson(
        ShippingCitiesModel instance) =>
    <String, dynamic>{
      'city_id': instance.cityId,
      'country_code': instance.countryCode,
      'state_code': instance.stateCode,
      'status': instance.status,
      'city': instance.city,
    };
