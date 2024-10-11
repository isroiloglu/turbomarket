// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      total: json['total'] as int?,
      avgRating: json['avg_rating'],
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Posts.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'total': instance.total,
      'avg_rating': instance.avgRating,
      'posts': instance.posts,
      'type': instance.type,
    };
