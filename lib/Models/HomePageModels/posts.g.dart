// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      name: json['name'] as String?,
      message: json['message'] as String?,
      ratingValue: json['rating_value'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'rating_value': instance.ratingValue,
      'timestamp': instance.timestamp,
    };
