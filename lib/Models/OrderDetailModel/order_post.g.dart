// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPost _$OrderPostFromJson(Map<String, dynamic> json) => OrderPost(
      json['post_id'] as String?,
      json['message'] as String?,
      json['user_name'] as String?,
      json['format_date'] as String?,
    );

Map<String, dynamic> _$OrderPostToJson(OrderPost instance) => <String, dynamic>{
      'post_id': instance.postId,
      'message': instance.message,
      'user_name': instance.userName,
      'format_date': instance.formatDate,
    };
