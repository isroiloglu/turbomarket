// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitOrderResponse _$SubmitOrderResponseFromJson(Map<String, dynamic> json) =>
    SubmitOrderResponse(
      json['order_id'] as int?,
      json['error'] as bool,
      json['msg'] as String?,
      json['url'] == null
          ? null
          : Url.fromJson(json['url'] as Map<String, dynamic>),
    )
      ..refreshToken = json['refreshtoken'] as String?
      ..billId = json['billId'] as String?
      ..type = json['type'] as String?
      ..userId = json['user_id'] as String?
      ..guestCheckout = json['guest_checkout'] as bool?
      ..anorVerify = json['anor_verify'] as bool?;

Map<String, dynamic> _$SubmitOrderResponseToJson(
        SubmitOrderResponse instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'error': instance.error,
      'msg': instance.msg,
      'url': instance.url,
      'refreshtoken': instance.refreshToken,
      'billId': instance.billId,
      'type': instance.type,
      'user_id': instance.userId,
      'guest_checkout': instance.guestCheckout,
      'anor_verify': instance.anorVerify,
    };

Url _$UrlFromJson(Map<String, dynamic> json) => Url(
      payment: json['payment'] as String? ?? '',
      success: json['success'] as String? ?? '',
    );

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
      'payment': instance.payment,
      'success': instance.success,
    };
