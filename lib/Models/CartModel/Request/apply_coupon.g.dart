// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyCoupon _$ApplyCouponFromJson(Map<String, dynamic> json) => ApplyCoupon(
      customerId: json['customerId'] as String?,
      width: json['width'] as int?,
      giftCode: json['gc'] as String?,
      langCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      deletePoints: json['deleted_points_in_use'] as String?,
      usedPoints: json['points_to_use'] as String?,
    );

Map<String, dynamic> _$ApplyCouponToJson(ApplyCoupon instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'width': instance.width,
      'gc': instance.giftCode,
      'lang_code': instance.langCode,
      'currency_code': instance.currencyCode,
      'deleted_points_in_use': instance.deletePoints,
      'points_to_use': instance.usedPoints,
    };
