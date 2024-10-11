// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingMethodModel _$ShippingMethodModelFromJson(Map<String, dynamic> json) =>
    ShippingMethodModel(
      json['all_shippings'] == null
          ? null
          : AllShipping.fromJson(json['all_shippings'] as Map<String, dynamic>),
      json['shipping'] == null
          ? null
          : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
      json['shipping_required'] as String?,
      json['msg'] as String?,
      json['success'] as bool?,
      json['error'] as bool?,
    );

Map<String, dynamic> _$ShippingMethodModelToJson(
        ShippingMethodModel instance) =>
    <String, dynamic>{
      'all_shippings': instance.allShipping,
      'shipping': instance.shipping,
      'shipping_required': instance.shippingRequired,
      'msg': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
