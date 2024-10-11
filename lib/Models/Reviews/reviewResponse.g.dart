// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      productId: json['product_id'],
      msg: json['msg'] as String?,
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'msg': instance.msg,
      'error': instance.error,
    };
