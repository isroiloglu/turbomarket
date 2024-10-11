// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseModel _$AddToCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseModel(
      msg: json['msg'] as String?,
      error: json['error'] as bool?,
      productTotal: json['product_total'],
      success: json['success'] as bool?,
      gId: json['g_id'] as String?,
      itemId: json['item_id'] as String?,
      warning: json['warning'] as bool?,
    );

Map<String, dynamic> _$AddToCartResponseModelToJson(
        AddToCartResponseModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'error': instance.error,
      'product_total': instance.productTotal,
      'success': instance.success,
      'g_id': instance.gId,
      'item_id': instance.itemId,
      'warning': instance.warning,
    };
