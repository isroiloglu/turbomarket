// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingEstimateRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingEstimateRequest _$ShippingEstimateRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingEstimateRequest(
      isCountry: json['countries'] as bool?,
      languageCode: json['lang_code'] as String?,
    );

Map<String, dynamic> _$ShippingEstimateRequestToJson(
        ShippingEstimateRequest instance) =>
    <String, dynamic>{
      'countries': instance.isCountry,
      'lang_code': instance.languageCode,
    };
