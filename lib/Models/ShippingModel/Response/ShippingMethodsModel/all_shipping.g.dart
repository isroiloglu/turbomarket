// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_shipping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllShipping _$AllShippingFromJson(Map<String, dynamic> json) => AllShipping(
      (json['shipping_info'] as List<dynamic>)
          .map((e) => ShippingInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_shipping_cost'] as String,
    );

Map<String, dynamic> _$AllShippingToJson(AllShipping instance) =>
    <String, dynamic>{
      'shipping_info': instance.shippingInfoList,
      'total_shipping_cost': instance.totalShippingCost,
    };
