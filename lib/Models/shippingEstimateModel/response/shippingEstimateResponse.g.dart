// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingEstimateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingEstimateResponse _$ShippingEstimateResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingEstimateResponse(
      countries: (json['countries'] as List<dynamic>?)
          ?.map(
              (e) => ShippingCountriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      error: json['error'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ShippingEstimateResponseToJson(
        ShippingEstimateResponse instance) =>
    <String, dynamic>{
      'countries': instance.countries,
      'success': instance.success,
      'error': instance.error,
      'msg': instance.msg,
    };
