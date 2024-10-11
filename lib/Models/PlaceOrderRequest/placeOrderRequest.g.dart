// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeOrderRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    PlaceOrderRequest(
      json['after_coupon_code_total'] as String?,
      json['apply_wallet_cash'] as bool?,
      json['company_id'] as String?,
      json['currency_code'] as String?,
      (json['current_cash'] as num?)?.toDouble(),
      json['gc'] as String?,
      GuestCheckoutModel.fromJson(
          json['guest_checkout'] as Map<String, dynamic>),
      json['lang_code'] as String?,
      json['notes'] as String?,
      json['payment_id'] as String?,
      json['ship_to_another'] as int?,
      (json['shipping_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['used_cash'] as int?,
      json['user_id'] as String?,
      (json['display_subtotal'] as num?)?.toDouble(),
      (json['wallet_system'] as num?)?.toDouble(),
      json['storefront_id'] as String?,
      json['store_id'] as String?,
      json['points_to_use'] as String?,
      PaymentInfoModel.fromJson(json['payment_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(PlaceOrderRequest instance) =>
    <String, dynamic>{
      'after_coupon_code_total': instance.afterCouponCodeTotal,
      'apply_wallet_cash': instance.applyWalletCash,
      'company_id': instance.companyId,
      'currency_code': instance.currencyCode,
      'current_cash': instance.currentCash,
      'gc': instance.gc,
      'guest_checkout': instance.guestCheckout,
      'lang_code': instance.langCode,
      'notes': instance.notes,
      'payment_id': instance.paymentId,
      'ship_to_another': instance.shipToAnother,
      'shipping_id': instance.shippingId,
      'used_cash': instance.usedCash,
      'user_id': instance.userId,
      'display_subtotal': instance.displaySubtotal,
      'wallet_system': instance.walletSystem,
      'storefront_id': instance.storeFrontId,
      'store_id': instance.storeId,
      'points_to_use': instance.pointsToUse,
      'payment_info': instance.paymentInfo,
    };
