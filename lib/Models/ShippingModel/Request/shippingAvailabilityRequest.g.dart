// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingAvailabilityRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingMethodAvailabilityRequest _$ShippingMethodAvailabilityRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingMethodAvailabilityRequest(
      json['lang_code'] as String?,
      json['country'] as String?,
      json['state'] as String?,
      json['city'] as String?,
      json['currency_code'] as String?,
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$ShippingMethodAvailabilityRequestToJson(
        ShippingMethodAvailabilityRequest instance) =>
    <String, dynamic>{
      'lang_code': instance.langCode,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'currency_code': instance.currencyCode,
      'storefront_id': instance.storeFrontId,
    };
