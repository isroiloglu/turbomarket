// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequest _$AddToCartRequestFromJson(Map<String, dynamic> json) =>
    AddToCartRequest(
      currencyCode: json['currency_code'] as String?,
      languageCode: json['lang_code'] as String?,
      productData: json['product_data'] as Map<String, dynamic>?,
      storefrontId: json['storefront_id'] as String?,
    );

Map<String, dynamic> _$AddToCartRequestToJson(AddToCartRequest instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'lang_code': instance.languageCode,
      'product_data': instance.productData,
      'storefront_id': instance.storefrontId,
    };
