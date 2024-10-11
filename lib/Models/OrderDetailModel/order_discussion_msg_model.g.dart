// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_discussion_msg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDiscussionMSGModel _$OrderDiscussionMSGModelFromJson(
        Map<String, dynamic> json) =>
    OrderDiscussionMSGModel(
      json['message'] as String?,
      json['thread_id'] as String?,
      json['is_discussion_initiate'] as String?,
      (json['posts'] as List<dynamic>?)
          ?.map((e) => OrderPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDiscussionMSGModelToJson(
        OrderDiscussionMSGModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'thread_id': instance.threadId,
      'is_discussion_initiate': instance.isDiscussionInitiate,
      'posts': instance.posts,
    };
