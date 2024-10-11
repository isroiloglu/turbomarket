// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartRequest _$UpdateCartRequestFromJson(Map<String, dynamic> json) =>
    UpdateCartRequest(
      scope: json['scope'] as String?,
      width: json['width'] as String?,
      gc: json['gc'] as String?,
      languageCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      cartProducts: (json['cart_products'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
      storeFrontId: json['storefront_id'] as String?,
      usedPoints: json['points_to_use'] as String?,
      deletePoints: json['deleted_points_in_use'] as String?,
    );

Map<String, dynamic> _$UpdateCartRequestToJson(UpdateCartRequest instance) =>
    <String, dynamic>{
      'scope': instance.scope,
      'width': instance.width,
      'gc': instance.gc,
      'lang_code': instance.languageCode,
      'currency_code': instance.currencyCode,
      'cart_products': instance.cartProducts,
      'storefront_id': instance.storeFrontId,
      'deleted_points_in_use': instance.deletePoints,
      'points_to_use': instance.usedPoints,
    };
