// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      json['product_id'] as String?,
      json['product'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['formatprice'],
      (json['list_price'] as num?)?.toDouble(),
      json['formatlist_price'],
      (json['discount'] as num?)?.toDouble(),
      json['is_discount'] as bool?,
      json['product_in_wishlist'] as bool,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['comments'] == null
          ? null
          : Comments.fromJson(json['comments'] as Map<String, dynamic>),
      json['item_id'],
      (json['dc_codes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['image'] as String?,
      json['dc_code'] as String?,
      json['add_to_cart'] as bool?,
      json['backOrder'] as bool?,
      json['inStock'] as bool?,
      json[''] as bool?,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product': instance.product,
      'price': instance.price,
      'formatprice': instance.formatPrice,
      'list_price': instance.listPrice,
      'formatlist_price': instance.formatListPrice,
      'discount': instance.discount,
      'is_discount': instance.isDiscount,
      'add_to_cart': instance.addToCart,
      'product_in_wishlist': instance.productInWishlist,
      'images': instance.images,
      'image': instance.image,
      'comments': instance.comments,
      'item_id': instance.itemId,
      'dc_codes': instance.dcCodes,
      'dc_code': instance.dcCode,
      'inStock': instance.inStock,
      'backOrder': instance.backOrder,
      '': instance.outOfStock,
    };
