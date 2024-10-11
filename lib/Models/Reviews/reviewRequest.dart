import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';
part 'reviewRequest.g.dart';

@JsonSerializable()
class SubmitReviewRequest{

  @JsonKey(name: "review_data")
  ReviewRequestData? reviewData;

  @JsonKey(name: "lang_code")
  String? languageCode;

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  SubmitReviewRequest({this.reviewData, this.languageCode,this.storefrontId});


  factory SubmitReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitReviewRequestToJson(this);

  void setReviewData(ReviewRequestData reviewData) {
    this.reviewData = reviewData;
  }
}