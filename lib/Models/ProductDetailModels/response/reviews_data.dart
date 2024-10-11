import 'package:json_annotation/json_annotation.dart';

import 'comments.dart';
import 'gdpr.dart';
part 'reviews_data.g.dart';

@JsonSerializable()
class ReviewsData{
  @JsonKey(name:"reviews")
  
   bool? reviews;
  @JsonKey(name:"comments")
  
   Comments? comments;
  @JsonKey(name:"gdpr")
  
   GDPR? gdpr;

  ReviewsData({this.reviews, this.comments, this.gdpr});

  factory ReviewsData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsDataToJson(this);
}