// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_infor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) => ShippingInfo(
      json['company_id'] as int,
      json['company'] as String,
      (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['show_text'] as bool,
      json['is_shipping_required'] as bool,
      json['shipping_text'] as String,
      (json['shipping_methods'] as List<dynamic>?)
          ?.map((e) => shippingMethods.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'company': instance.company,
      'products': instance.productList,
      'show_text': instance.showText,
      'is_shipping_required': instance.isShippingRequired,
      'shipping_text': instance.shippingText,
      'shipping_methods': instance.shippingMethodList,
    };
