import 'package:json_annotation/json_annotation.dart';

part 'order_post.g.dart';

@JsonSerializable()
class OrderPost {
  @JsonKey(name: "post_id")
  String? postId;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "format_date")
  String? formatDate;

  OrderPost(this.postId, this.message, this.userName, this.formatDate);

  factory OrderPost.fromJson(Map<String, dynamic> json) =>
      _$OrderPostFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPostToJson(this);
}
