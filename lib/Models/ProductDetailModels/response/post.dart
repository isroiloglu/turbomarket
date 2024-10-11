import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post{
  @JsonKey(name:"name")
  
  String? name;
  @JsonKey(name:"message")
  
  String? message;
  @JsonKey(name:"rating_value")
  
  String? ratingValue;
  @JsonKey(name:"timestamp")
  
  String? timestamp;

  Post({
     this.name,
     this.message,
     this.ratingValue,
     this.timestamp,
  });

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}