import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/posts.dart';
part 'product_comments.g.dart';
@JsonSerializable()
class Comments {
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "avg_rating")
  dynamic avgRating;
  @JsonKey(name: "posts")
  List<Posts>? posts;
  @JsonKey(name: "type")
  String? type;

  Comments({this.total, this.avgRating, this.posts, this.type});

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}