// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      total: json['total'] as int?,
      type: json['type'] as String?,
      avgRating: json['avg_rating'],
    )..posts = (json['posts'] as List<dynamic>?)
        ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'total': instance.total,
      'type': instance.type,
      'avg_rating': instance.avgRating,
      'posts': instance.posts,
    };
