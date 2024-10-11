// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      json['product_id'],
      json['product_code'] as String?,
      json['product'] as String?,
      json['amount'],
      (json['price'] as num?)?.toDouble(),
      json['formatprice'] as String?,
      json['subtotal'] as String?,
      json['price_in_points'] as int?,
      json['image_path'] as String?,
    );

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_code': instance.productCode,
      'product': instance.product,
      'amount': instance.amount,
      'price': instance.price,
      'formatprice': instance.formatPrice,
      'subtotal': instance.subtotal,
      'price_in_points': instance.priceInPoints,
      'image_path': instance.imagePath,
    };
