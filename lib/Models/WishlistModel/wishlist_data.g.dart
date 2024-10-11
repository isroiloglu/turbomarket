// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistData _$WishlistDataFromJson(Map<String, dynamic> json) => WishlistData(
      json['product_id'] as int?,
      json['item_id'] as String?,
      json['product'] as String?,
      json['price'],
      json['formatprice'] as String?,
      (json['list_price'] as num?)?.toDouble(),
      json['formatlist_price'] as String?,
      json['image'] as String?,
      json['is_discount'] as bool?,
      (json['discount'] as num?)?.toDouble(),
      json['outOfStock'] as bool?,
      json['backOrder'] as bool?,
      json['inStock'] as bool?,
    );

Map<String, dynamic> _$WishlistDataToJson(WishlistData instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'item_id': instance.itemId,
      'product': instance.product,
      'price': instance.price,
      'formatprice': instance.formatPrice,
      'list_price': instance.listPrice,
      'formatlist_price': instance.formatListPrice,
      'image': instance.imagePath,
      'inStock': instance.inStock,
      'backOrder': instance.backOrder,
      'outOfStock': instance.outOfStock,
      'is_discount': instance.isDiscount,
      'discount': instance.discount,
    };
