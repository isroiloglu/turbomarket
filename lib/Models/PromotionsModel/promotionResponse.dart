import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PromotionsModel/promotions.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PromotionsModel/search.dart';
part 'promotionResponse.g.dart';

@JsonSerializable()
class PromotionResponse{

  @JsonKey(name:"promotions")
  List<Promotions>? promotions;

  @JsonKey(name:"search")
  PromotionSearch? search;

  PromotionResponse(this.promotions, this.search);


  factory PromotionResponse.fromJson(Map<String, dynamic> json) =>
      _$PromotionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionResponseToJson(this);
}