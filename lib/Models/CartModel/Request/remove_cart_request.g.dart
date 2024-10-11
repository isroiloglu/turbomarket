// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCartRequest _$RemoveCartRequestFromJson(Map<String, dynamic> json) =>
    RemoveCartRequest(
      customerId: json['customerId'] as String?,
      width: json['width'] as int?,
      giftCode: json['gc'] as String?,
      scope: json['scope'] as String?,
      langCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
    );

Map<String, dynamic> _$RemoveCartRequestToJson(RemoveCartRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'width': instance.width,
      'gc': instance.giftCode,
      'scope': instance.scope,
      'lang_code': instance.langCode,
      'currency_code': instance.currencyCode,
    };
