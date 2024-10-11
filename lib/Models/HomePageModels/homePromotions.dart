import 'package:json_annotation/json_annotation.dart';
part 'homePromotions.g.dart';



@JsonSerializable()
class Promotions{

  @JsonKey(name:"promotion_id")
  String? promotionId;

  @JsonKey(name:"image")
  String? image;

  @JsonKey(name:"name")
  String? name;

  Promotions(this.promotionId, this.image, this.name);

  factory Promotions.fromJson(Map<String, dynamic> json) =>
      _$PromotionsFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionsToJson(this);
}