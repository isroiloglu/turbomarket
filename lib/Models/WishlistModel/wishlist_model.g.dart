// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistModel _$WishlistModelFromJson(Map<String, dynamic> json) =>
    WishlistModel(
      (json['wishlist_data'] as List<dynamic>?)
          ?.map((e) => WishlistData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as bool?,
      json['msg'] as String?,
      json['wishListSize'] as int?,
    );

Map<String, dynamic> _$WishlistModelToJson(WishlistModel instance) =>
    <String, dynamic>{
      'wishlist_data': instance.wishlistData,
      'error': instance.error,
      'msg': instance.msg,
      'wishListSize': instance.wishListSize,
    };
