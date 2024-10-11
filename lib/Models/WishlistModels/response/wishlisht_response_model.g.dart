// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlisht_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListResponseModel _$WishListResponseModelFromJson(
        Map<String, dynamic> json) =>
    WishListResponseModel(
      json['error'] as bool?,
      json['item_id'],
      json['msg'] as String?,
      json['product_count'] as String?,
      json['g_id'] as String?,
    );

Map<String, dynamic> _$WishListResponseModelToJson(
        WishListResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'item_id': instance.itemId,
      'msg': instance.msg,
      'product_count': instance.productCount,
      'g_id': instance.gId,
    };
