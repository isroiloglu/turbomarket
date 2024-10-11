// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingCountriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingCountriesModel _$ShippingCountriesModelFromJson(
        Map<String, dynamic> json) =>
    ShippingCountriesModel(
      code: json['code'] as String?,
      codeA3: json['code_A3'] as String?,
      codeN3: json['code_N3'] as String?,
      status: json['status'] as String?,
      region: json['region'] as String?,
      states: (json['states'] as List<dynamic>?)
          ?.map((e) => ShippingStatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..country = json['country'] as String?;

Map<String, dynamic> _$ShippingCountriesModelToJson(
        ShippingCountriesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code_A3': instance.codeA3,
      'code_N3': instance.codeN3,
      'status': instance.status,
      'region': instance.region,
      'country': instance.country,
      'states': instance.states,
    };
