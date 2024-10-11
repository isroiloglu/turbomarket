// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['order_id'] as String?,
      json['issuer_id'] as String?,
      json['user_id'] as String?,
      json['is_parent_order'] as String?,
      json['parent_order_id'] as String?,
      json['company_id'] as String?,
      json['timestamp'] as String?,
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['status'] as String?,
      json['total'] as String?,
      json['invoice_id'],
      json['credit_memo_id'],
      json['points'],
      json['color'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'issuer_id': instance.issuerId,
      'user_id': instance.userId,
      'is_parent_order': instance.isParentOrder,
      'parent_order_id': instance.parentOrderId,
      'company_id': instance.companyId,
      'timestamp': instance.timestamp,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'total': instance.total,
      'invoice_id': instance.invoiceId,
      'credit_memo_id': instance.creditMemoId,
      'points': instance.points,
      'color': instance.color,
    };
