import 'package:json_annotation/json_annotation.dart';
part 'update_cart_request.g.dart';
@JsonSerializable()
class UpdateCartRequest{
  @JsonKey(name:"scope")
  
   String? scope;
  @JsonKey(name:"width")
  
   String? width;
  @JsonKey(name:"gc")
  
   String? gc;
  @JsonKey(name:"lang_code")
  
   String? languageCode;
  @JsonKey(name:"currency_code")
  
   String? currencyCode;
  @JsonKey(name:"cart_products")
  
   Map<String, Map<String, dynamic>>? cartProducts;

  @JsonKey(name:"storefront_id")
  String? storeFrontId;

  @JsonKey(name: "deleted_points_in_use")
  String? deletePoints;

  @JsonKey(name: "points_to_use")
  String? usedPoints;

  UpdateCartRequest({
     this.scope,
     this.width,
     this.gc,
     this.languageCode,
     this.currencyCode,
     this.cartProducts,
    this.storeFrontId,
    this.usedPoints,
    this.deletePoints
  });

  factory UpdateCartRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartRequestToJson(this);
}