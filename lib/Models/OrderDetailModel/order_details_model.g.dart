// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    OrderDetailsModel(
      json['order_id'] as String?,
      json['company_id'] as String?,
      json['user_id'] as String?,
      json['summary'] == null
          ? null
          : OrderSummary.fromJson(json['summary'] as Map<String, dynamic>),
      json['timestamp'] as String?,
      json['status'] as String?,
      json['user_name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['fax'] as String?,
      json['payment_method'] as String?,
      json['notes'] as String?,
      json['secondary_currency'] as String?,
      json['shipping_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
      json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      (json['products'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['use_gift_certificates'] as List<dynamic>?)
          ?.map((e) => UseGiftCertificates.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['applied_coupons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['promotions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['shipping_method'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['rma'] as int?,
      json['is_discussion_initiate'] as int?,
      json['thread_id'] as String?,
      (json['posts'] as List<dynamic>?)
          ?.map((e) => OrderPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as bool?,
      json['msg'] as String?,
      json['latest'] as bool?,
      json['po_number'] as String?,
      json['company_name'] as String?,
      json['buyer_name'] as String?,
      json['position'] as String?,
      json['card_number'] as String?,
      json['cardholder_name'] as String?,
      json['expiry_month'] as String?,
      json['expiry_year'] as String?,
      json['user_points'],
      json['points_in_use'],
      json['reward_points'],
      json['store_data'] == null
          ? null
          : StoreData.fromJson(json['store_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsModelToJson(OrderDetailsModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'company_id': instance.companyId,
      'user_id': instance.userId,
      'summary': instance.summary,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'fax': instance.fax,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'secondary_currency': instance.secondaryCurrency,
      'shipping_address': instance.shippingAddress,
      'billing_address': instance.billingAddress,
      'products': instance.products,
      'use_gift_certificates': instance.giftCertficates,
      'applied_coupons': instance.appliedCoupons,
      'promotions': instance.promotions,
      'shipping_method': instance.shippingMethod,
      'rma': instance.rma,
      'is_discussion_initiate': instance.isDiscussionInitiate,
      'thread_id': instance.threadId,
      'posts': instance.posts,
      'error': instance.error,
      'msg': instance.msg,
      'latest': instance.latest,
      'po_number': instance.poNumber,
      'company_name': instance.companyName,
      'buyer_name': instance.buyerName,
      'position': instance.position,
      'card_number': instance.cardNumber,
      'cardholder_name': instance.cardholderName,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'user_points': instance.userPoints,
      'points_in_use': instance.pointsInUse,
      'reward_points': instance.rewardPoints,
      'store_data': instance.storeData,
    };
