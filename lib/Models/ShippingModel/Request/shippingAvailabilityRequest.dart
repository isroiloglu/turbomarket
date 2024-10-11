import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/profileData.dart';
part 'shippingAvailabilityRequest.g.dart';

@JsonSerializable()
class ShippingMethodAvailabilityRequest{

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


      ShippingMethodAvailabilityRequest(this.langCode, this.country,this.state,this.city,this.currencyCode,this.storeFrontId);
  ShippingMethodAvailabilityRequest.empty();

  factory ShippingMethodAvailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodAvailabilityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodAvailabilityRequestToJson(this);
}