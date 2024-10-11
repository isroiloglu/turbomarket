// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingStatesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingStatesModel _$ShippingStatesModelFromJson(Map<String, dynamic> json) =>
    ShippingStatesModel(
      code: json['code'],
      state: json['state'] as String?,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => ShippingCitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingStatesModelToJson(
        ShippingStatesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'state': instance.state,
      'cities': instance.cities,
    };
