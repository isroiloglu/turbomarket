import 'package:json_annotation/json_annotation.dart';
part 'apply_coupon.g.dart';

@JsonSerializable()
class ApplyCoupon{
  @JsonKey(name:"customerId")
  String? customerId;
  @JsonKey(name:"width")
  int? width;
  @JsonKey(name:"gc")
  String? giftCode;
  @JsonKey(name:"lang_code")
  String? langCode;
  @JsonKey(name:"currency_code")
  String? currencyCode;
  @JsonKey(name: "deleted_points_in_use")
  String? deletePoints;

  @JsonKey(name: "points_to_use")
  String? usedPoints;

  ApplyCoupon({
    this.customerId,
    this.width,
    this.giftCode,
    this.langCode,
    this.currencyCode,
    this.deletePoints, this.usedPoints
  });

  factory ApplyCoupon.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyCouponToJson(this);
}