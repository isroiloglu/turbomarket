import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/profileData.dart';
part 'submitShippingDetails.g.dart';

@JsonSerializable()
class SubmitShippingDetails{
  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"country")
  String? country;

  @JsonKey(name:"state")
  String? state;

  @JsonKey(name:"city")
  String? city;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"storefront_id")
  String? storeFrontId;

  @JsonKey(name:"shipping_id")
  String? shippingId;

  @JsonKey(name:"store_id")
  String? storeId;


  SubmitShippingDetails(this.langCode, this.country,this.state,this.city,this.currencyCode,this.storeFrontId, this.shippingId, this.storeId);
  SubmitShippingDetails.empty();

  factory SubmitShippingDetails.fromJson(Map<String, dynamic> json) =>
      _$SubmitShippingDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitShippingDetailsToJson(this);
}