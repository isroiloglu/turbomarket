// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCartItemRequest _$RemoveCartItemRequestFromJson(
        Map<String, dynamic> json) =>
    RemoveCartItemRequest(
      customerId: json['customerId'] as String?,
      width: json['width'] as int?,
      giftCode: json['gc'] as String?,
      scope: json['scope'] as String?,
      itemId: json['item_id'] as String?,
      langCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
    );

Map<String, dynamic> _$RemoveCartItemRequestToJson(
        RemoveCartItemRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'width': instance.width,
      'gc': instance.giftCode,
      'scope': instance.scope,
      'item_id': instance.itemId,
      'lang_code': instance.langCode,
      'currency_code': instance.currencyCode,
    };
