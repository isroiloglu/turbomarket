// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_promotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedPromotions _$AppliedPromotionsFromJson(Map<String, dynamic> json) =>
    AppliedPromotions(
      promotionId: json['promotion_id'] as String?,
      name: json['name'] as String?,
      cancelCoupon: json['cancel_coupon'] as bool?,
      couponCode: json['coupon_code'] as String?,
    );

Map<String, dynamic> _$AppliedPromotionsToJson(AppliedPromotions instance) =>
    <String, dynamic>{
      'promotion_id': instance.promotionId,
      'name': instance.name,
      'cancel_coupon': instance.cancelCoupon,
      'coupon_code': instance.couponCode,
    };
