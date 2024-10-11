// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxSubtotal: json['tax_subtotal'],
      formatTaxSubtotal: json['format_tax_subtotal'] as String?,
      discount: json['discount'],
      formatDiscount: json['format_discount'] as String?,
      total: json['total'],
      formatTotal: json['format_total'] as String?,
      amount: json['amount'] as int?,
      displaySubtotal: json['display_subtotal'],
      formatDisplaySubtotal: json['format_display_subtotal'] as String?,
      displayShippingCost: json['display_shipping_cost'],
      formatDisplayShippingCost:
          json['format_display_shipping_cost'] as String?,
      appliedPromotions: (json['applied_promotions'] as List<dynamic>?)
          ?.map((e) => AppliedPromotions.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingCertificates: (json['pending_certificates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      giftCertCost: json['gift_cert_cost'] as String?,
      formatTax: json['format_tax'],
      orderDiscount: json['format_order_discount'],
      taxSummary: json['tax_summary'] == null
          ? null
          : TaxSummary.fromJson(json['tax_summary'] as Map<String, dynamic>),
      storeData: json['store_data'] == null
          ? null
          : StoreData.fromJson(json['store_data'] as Map<String, dynamic>),
      formatShippingCost: json['format_shipping_cost'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      shippingId: json['shipping_id'] as String?,
      shippingName: json['shipping_name'] as String?,
      userPoints: json['user_points'] as int?,
      pointsInUse: json['points_in_use'] as int?,
      allowPaymentByPoints: json['allowPaymentByPoints'] as bool?,
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'products': instance.products,
      'tax_subtotal': instance.taxSubtotal,
      'format_tax_subtotal': instance.formatTaxSubtotal,
      'discount': instance.discount,
      'format_discount': instance.formatDiscount,
      'total': instance.total,
      'format_total': instance.formatTotal,
      'amount': instance.amount,
      'display_subtotal': instance.displaySubtotal,
      'format_display_subtotal': instance.formatDisplaySubtotal,
      'display_shipping_cost': instance.displayShippingCost,
      'format_display_shipping_cost': instance.formatDisplayShippingCost,
      'applied_promotions': instance.appliedPromotions,
      'pending_certificates': instance.pendingCertificates,
      'gift_cert_cost': instance.giftCertCost,
      'format_tax': instance.formatTax,
      'format_order_discount': instance.orderDiscount,
      'tax_summary': instance.taxSummary,
      'shipping_id': instance.shippingId,
      'shipping_cost': instance.shippingCost,
      'format_shipping_cost': instance.formatShippingCost,
      'shipping_name': instance.shippingName,
      'store_data': instance.storeData,
      'user_points': instance.userPoints,
      'points_in_use': instance.pointsInUse,
      'allowPaymentByPoints': instance.allowPaymentByPoints,
    };
