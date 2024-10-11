// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myPointsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPointResponse _$MyPointResponseFromJson(Map<String, dynamic> json) =>
    MyPointResponse(
      json['points'],
      json['error'] as bool?,
      json['success'] as bool?,
      (json['userlog'] as List<dynamic>?)
          ?.map((e) => PointsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyPointResponseToJson(MyPointResponse instance) =>
    <String, dynamic>{
      'points': instance.points,
      'error': instance.error,
      'success': instance.success,
      'userlog': instance.pointsDataList,
    };
