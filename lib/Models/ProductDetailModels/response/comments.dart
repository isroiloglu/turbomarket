import 'package:json_annotation/json_annotation.dart';


import 'post.dart';

part 'comments.g.dart';

@JsonSerializable()
class Comments {
  @JsonKey(name:"total")
  int? total;

  @JsonKey(name:"type")
  String? type;

  @JsonKey(name:"avg_rating")
  dynamic avgRating;

  @JsonKey(name:"posts")
  List<Post>? posts;



  Comments({
     this.total,
     this.type,
     this.avgRating,

  });

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}