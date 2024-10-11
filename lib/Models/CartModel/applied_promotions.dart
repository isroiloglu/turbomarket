import 'package:json_annotation/json_annotation.dart';
part 'applied_promotions.g.dart';
@JsonSerializable()
class AppliedPromotions{

  @JsonKey(name: "promotion_id")
  String? promotionId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "cancel_coupon")
  bool? cancelCoupon;

  @JsonKey(name: "coupon_code")
  String? couponCode;

  AppliedPromotions({this.promotionId, this.name, this.cancelCoupon, this.couponCode});

  factory AppliedPromotions.fromJson(Map<String, dynamic> json) =>
      _$AppliedPromotionsFromJson(json);

  Map<String, dynamic> toJson() => _$AppliedPromotionsToJson(this);
}