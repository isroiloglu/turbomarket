import 'package:json_annotation/json_annotation.dart';
part 'reviewRequestData.g.dart';

@JsonSerializable()
class ReviewRequestData{

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "rating_value")
  double? ratingValue;
  @JsonKey(name: "user_id")
  String? customerId;
  @JsonKey(name: "select_gdpr_agreement")
  String? selectGdprAgreement;

  ReviewRequestData({this.name, this.message, this.ratingValue, this.customerId, this.selectGdprAgreement});


  factory ReviewRequestData.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestDataToJson(this);
}