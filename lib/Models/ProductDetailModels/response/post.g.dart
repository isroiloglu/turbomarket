// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      name: json['name'] as String?,
      message: json['message'] as String?,
      ratingValue: json['rating_value'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'rating_value': instance.ratingValue,
      'timestamp': instance.timestamp,
    };
