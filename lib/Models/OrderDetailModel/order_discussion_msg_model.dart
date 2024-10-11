import 'package:json_annotation/json_annotation.dart';

import 'order_post.dart';

part 'order_discussion_msg_model.g.dart';

@JsonSerializable()
class OrderDiscussionMSGModel  {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "thread_id")
  String? threadId;
  @JsonKey(name: "is_discussion_initiate")
  String? isDiscussionInitiate;
  @JsonKey(name: "posts")
  List<OrderPost>? posts;


  OrderDiscussionMSGModel(
      this.message, this.threadId, this.isDiscussionInitiate, this.posts);

  factory OrderDiscussionMSGModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDiscussionMSGModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDiscussionMSGModelToJson(this);
}