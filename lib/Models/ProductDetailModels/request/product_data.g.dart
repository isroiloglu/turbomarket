// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      amount: json['amount'] as String?,
      productOptions: (json['product_options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      extra: (json['extra'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      productId: json['product_id'] as String?,
      objectId: json['object_id'] as String?,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'product_options': instance.productOptions,
      'extra': instance.extra,
      'product_id': instance.productId,
      'object_id': instance.objectId,
    };
