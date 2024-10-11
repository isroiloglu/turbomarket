// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderTrackModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackModel _$OrderTrackModelFromJson(Map<String, dynamic> json) =>
    OrderTrackModel(
      trackData: json['trackData'] as bool?,
      msg: json['msg'] as String?,
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$OrderTrackModelToJson(OrderTrackModel instance) =>
    <String, dynamic>{
      'trackData': instance.trackData,
      'msg': instance.msg,
      'error': instance.error,
    };
