// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsData _$PointsDataFromJson(Map<String, dynamic> json) => PointsData(
      json['change_id'] as String?,
      json['action'] as String?,
      json['timestamp'] as String?,
      json['amount'] as String?,
      json['reason'] as String?,
      json['order_id'] as String?,
    );

Map<String, dynamic> _$PointsDataToJson(PointsData instance) =>
    <String, dynamic>{
      'change_id': instance.changeId,
      'action': instance.action,
      'timestamp': instance.timestamp,
      'amount': instance.amount,
      'reason': instance.reason,
      'order_id': instance.orderId,
    };
