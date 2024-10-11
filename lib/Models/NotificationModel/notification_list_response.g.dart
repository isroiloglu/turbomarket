// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      typeData: json['type_data'] as String?,
      content: json['content'] as String?,
      status: json['status'] as String?,
      time: json['time'] as String?,
      imagePath: json['image_path'] as String,
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'type_data': instance.typeData,
      'content': instance.content,
      'status': instance.status,
      'time': instance.time,
      'image_path': instance.imagePath,
    };
