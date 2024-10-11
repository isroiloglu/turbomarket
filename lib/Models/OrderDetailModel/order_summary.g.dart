// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) => OrderSummary(
      json['total'] as String?,
      json['formattotal'] as String?,
      json['subtotal'],
      json['formatsubtotal'] as String?,
      (json['discount'] as num?)?.toDouble(),
      json['formatdiscount'] as String?,
      (json['payment_surcharge'] as num?)?.toDouble(),
      json['formatpayment_surcharge'] as String?,
      (json['taxes'] as List<dynamic>?)
          ?.map((e) => OrderTaxes.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['shipping_cost'] as String?,
      json['formatshipping_cost'] as String?,
      json['format_order_discount'] as String,
    );

Map<String, dynamic> _$OrderSummaryToJson(OrderSummary instance) =>
    <String, dynamic>{
      'total': instance.total,
      'formattotal': instance.formatTotal,
      'subtotal': instance.subtotal,
      'formatsubtotal': instance.formatSubtotal,
      'discount': instance.discount,
      'formatdiscount': instance.formatDiscount,
      'payment_surcharge': instance.paymentSurcharge,
      'formatpayment_surcharge': instance.formatPaymentSurcharge,
      'taxes': instance.taxes,
      'shipping_cost': instance.shippingCost,
      'formatshipping_cost': instance.formatShippingCost,
      'format_order_discount': instance.orderDiscount,
    };
