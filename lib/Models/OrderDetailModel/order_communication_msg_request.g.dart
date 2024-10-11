// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_communication_msg_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCommunicationMSGRequest _$OrderCommunicationMSGRequestFromJson(
        Map<String, dynamic> json) =>
    OrderCommunicationMSGRequest(
      json['message'] as String?,
      json['thread_id'] as String?,
      json['order_id'] as String?,
      json['name'] as String?,
      json['select_gdpr_agreement'] as String?,
      json['gdprAggrement'] as bool?,
      json['user_id'] as String?,
      json['user_type'] as String?,
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$OrderCommunicationMSGRequestToJson(
        OrderCommunicationMSGRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'thread_id': instance.threadId,
      'order_id': instance.orderId,
      'name': instance.name,
      'select_gdpr_agreement': instance.selectGdprAgreement,
      'gdprAggrement': instance.gdprAggrement,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'storefront_id': instance.storefrontDd,
    };
