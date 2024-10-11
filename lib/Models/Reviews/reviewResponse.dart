import 'package:json_annotation/json_annotation.dart';
part 'reviewResponse.g.dart';

@JsonSerializable()
class ReviewResponse{

  @JsonKey(name: "product_id")
  dynamic productId;

  @JsonKey(name: "msg")
  String? msg;

  @JsonKey(name: "error")
  bool? error;

  ReviewResponse({this.productId, this.msg, this.error});


  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}