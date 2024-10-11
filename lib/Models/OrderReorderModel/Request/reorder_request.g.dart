// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReorderRequest _$ReorderRequestFromJson(Map<String, dynamic> json) =>
    ReorderRequest(
      orderId: json['order_id'] as String?,
      userId: json['user_id'] as String?,
    )..storefrontId = json['storefront_id'] as String?;

Map<String, dynamic> _$ReorderRequestToJson(ReorderRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'user_id': instance.userId,
      'storefront_id': instance.storefrontId,
    };
