// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReorderResponse _$ReorderResponseFromJson(Map<String, dynamic> json) =>
    ReorderResponse(
      json['message'] as String?,
      json['product_total'],
      json['added'] as bool?,
      json['error'] as bool?,
    );

Map<String, dynamic> _$ReorderResponseToJson(ReorderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'product_total': instance.productTotal,
      'added': instance.added,
      'error': instance.error,
    };
