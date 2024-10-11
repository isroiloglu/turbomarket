// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitOrderRequestData _$SubmitOrderRequestDataFromJson(
        Map<String, dynamic> json) =>
    SubmitOrderRequestData(
      json['after_coupon_code_total'] as String?,
      json['apply_wallet_cash'] as bool?,
      json['company_id'] as String?,
      json['currency_code'] as String?,
      json['gc'] as String?,
      json['guest_checkout'] == null
          ? null
          : ShippingMethodRequest.fromJson(
              json['guest_checkout'] as Map<String, dynamic>),
      json['lang_code'] as String?,
      json['notes'] as String?,
      json['payment_id'] as String?,
      json['ship_to_another'] as int?,
      (json['shipping_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['user_id'] as String?,
      (json['display_subtotal'] as num?)?.toDouble(),
      (json['wallet_system'] as num?)?.toDouble(),
      json['card_number'] as String?,
      json['expiry_month'] as String?,
      json['expiry_year'] as String?,
      json['cardholder_name'] as String?,
      json['cvv2'] as String?,
      json['po_number'] as String?,
      json['company_name'] as String?,
      json['buyer_name'] as String?,
      json['position'] as String?,
      json['storefront_id'] as String?,
    )..currentCash = (json['current_cash'] as num?)?.toDouble();

Map<String, dynamic> _$SubmitOrderRequestDataToJson(
        SubmitOrderRequestData instance) =>
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
      'user_id': instance.userId,
      'display_subtotal': instance.displaySubtotal,
      'wallet_system': instance.walletSystem,
      'card_number': instance.cardNumber,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'cardholder_name': instance.cardholderName,
      'cvv2': instance.cvv2,
      'po_number': instance.poNumber,
      'company_name': instance.companyName,
      'buyer_name': instance.buyerName,
      'position': instance.position,
      'storefront_id': instance.storeFrontId,
    };
