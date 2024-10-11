import 'package:json_annotation/json_annotation.dart';
part 'posts.g.dart';

@JsonSerializable()
class Posts {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "rating_value")
  String? ratingValue;
  @JsonKey(name: "timestamp")
  String? timestamp;

  Posts({this.name, this.message, this.ratingValue, this.timestamp});

  factory Posts.fromJson(Map<String, dynamic> json) =>
      _$PostsFromJson(json);

  Map<String, dynamic> toJson() => _$PostsToJson(this);
}