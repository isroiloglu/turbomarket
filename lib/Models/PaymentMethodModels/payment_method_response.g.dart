// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodResponse _$PaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodResponse(
      paymentMethod: (json['payment_method'] as List<dynamic>)
          .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderTotal: (json['order_total'] as num?)?.toDouble(),
      formatedOrderTotal: json['formated_order_total'] as String?,
      currencyCode: json['currency_code'] as String?,
      error: json['error'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$PaymentMethodResponseToJson(
        PaymentMethodResponse instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'order_total': instance.orderTotal,
      'formated_order_total': instance.formatedOrderTotal,
      'currency_code': instance.currencyCode,
      'error': instance.error,
      'msg': instance.msg,
    };
