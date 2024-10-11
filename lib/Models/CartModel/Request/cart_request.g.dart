// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRequest _$CartRequestFromJson(Map<String, dynamic> json) => CartRequest(
      customerId: json['customerId'] as String?,
      width: json['width'] as int?,
      giftCode: json['gc'] as String?,
      walletSystem: json['wallet_system'] as int?,
      totalCash: json['total_cash'] as String?,
      subtotal: (json['display_subtotal'] as num?)?.toDouble(),
      formatedSubtotal: json['format_display_subtotal'] as String?,
      walletCartId: json['wallet_cart_id'] as String?,
      rechargeAmount: json['recharge_amount'] as String?,
      langCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      usedPoints: json['points_to_use'] as String?,
      deletedPoints: json['deleted_points_in_use'] as String?,
    );

Map<String, dynamic> _$CartRequestToJson(CartRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'width': instance.width,
      'gc': instance.giftCode,
      'wallet_system': instance.walletSystem,
      'total_cash': instance.totalCash,
      'display_subtotal': instance.subtotal,
      'format_display_subtotal': instance.formatedSubtotal,
      'wallet_cart_id': instance.walletCartId,
      'recharge_amount': instance.rechargeAmount,
      'lang_code': instance.langCode,
      'currency_code': instance.currencyCode,
      'points_to_use': instance.usedPoints,
      'deleted_points_in_use': instance.deletedPoints,
    };
