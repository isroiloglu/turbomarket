// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
      (json['shipping_methods'] as List<dynamic>)
          .map((e) => shippingMethods.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['is_shipping_required'] as bool?,
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'shipping_methods': instance.shippingMethodList,
      'is_shipping_required': instance.isShippingRequired,
    };
