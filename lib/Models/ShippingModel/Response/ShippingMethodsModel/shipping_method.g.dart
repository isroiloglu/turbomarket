// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

shippingMethods _$shippingMethodsFromJson(Map<String, dynamic> json) =>
    shippingMethods(
      json['shipping_id'] as String?,
      json['shipping'] as String?,
      json['delivery_time'] as String?,
      json['rate'] as String?,
      json['description'] as String?,
      json['free_shipping'] as bool,
      (json['stores'] as List<dynamic>?)
          ?.map((e) => ShippingStoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$shippingMethodsToJson(shippingMethods instance) =>
    <String, dynamic>{
      'shipping_id': instance.shippingId,
      'shipping': instance.shipping,
      'delivery_time': instance.deliveryTime,
      'rate': instance.rate,
      'description': instance.description,
      'free_shipping': instance.freeShipping,
      'stores': instance.stores,
    };
