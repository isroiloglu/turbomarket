import 'package:json_annotation/json_annotation.dart';
part 'cart_request.g.dart';

@JsonSerializable()
class CartRequest{
  @JsonKey(name:"customerId") 
  String? customerId;
  @JsonKey(name:"width")
      int? width;
  @JsonKey(name:"gc")
  String? giftCode;
  @JsonKey(name:"wallet_system")
  int? walletSystem;
   @JsonKey(name:"total_cash")
   String? totalCash;
   @JsonKey(name:"display_subtotal")
   double? subtotal;
   @JsonKey(name:"format_display_subtotal")
   String? formatedSubtotal;
   @JsonKey(name:"wallet_cart_id")
   String? walletCartId;
   @JsonKey(name:"recharge_amount")
   String? rechargeAmount;
   @JsonKey(name:"lang_code")
   String? langCode;
   @JsonKey(name:"currency_code")
   String? currencyCode;
   @JsonKey(name: "points_to_use")
   String? usedPoints;
   @JsonKey(name: "deleted_points_in_use")
   String? deletedPoints;


  CartRequest({
     this.customerId,
     this.width,
     this.giftCode,
     this.walletSystem,
     this.totalCash,
     this.subtotal,
     this.formatedSubtotal,
     this.walletCartId,
     this.rechargeAmount,
     this.langCode,
     this.currencyCode,
     this.usedPoints,
    this.deletedPoints
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) =>
      _$CartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartRequestToJson(this);
}