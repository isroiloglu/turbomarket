// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitShippingDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitShippingDetails _$SubmitShippingDetailsFromJson(
        Map<String, dynamic> json) =>
    SubmitShippingDetails(
      json['lang_code'] as String?,
      json['country'] as String?,
      json['state'] as String?,
      json['city'] as String?,
      json['currency_code'] as String?,
      json['storefront_id'] as String?,
      json['shipping_id'] as String?,
      json['store_id'] as String?,
    );

Map<String, dynamic> _$SubmitShippingDetailsToJson(
        SubmitShippingDetails instance) =>
    <String, dynamic>{
      'lang_code': instance.langCode,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'currency_code': instance.currencyCode,
      'storefront_id': instance.storeFrontId,
      'shipping_id': instance.shippingId,
      'store_id': instance.storeId,
    };
