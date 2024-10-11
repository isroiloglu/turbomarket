// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusResponse _$OrderStatusResponseFromJson(Map<String, dynamic> json) =>
    OrderStatusResponse(
      error: json['error'] as bool? ?? false,
      orderId: json['order_id'] as String? ?? '',
      orderStatus: json['order_status'] as String? ?? '',
      isSuccess: json['is_success'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderStatusResponseToJson(
        OrderStatusResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'order_id': instance.orderId,
      'order_status': instance.orderStatus,
      'is_success': instance.isSuccess,
    };
