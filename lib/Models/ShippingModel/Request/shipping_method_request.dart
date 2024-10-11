import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Request/user_data.dart';
part 'shipping_method_request.g.dart';


@JsonSerializable()
class ShippingMethodRequest{

  @JsonKey(name:"currency_code")
  String? currencyCode="";

  @JsonKey(name:"gc")
  List<String>? gc = [];

  @JsonKey(name:"lang_code")
  String? langCode="";

  @JsonKey(name:"profile_id")
  String? profileId="";

  @JsonKey(name:"update_user_data")
  String? updateUserData="";

  @JsonKey(name:"view")
  String? view="";

  @JsonKey(name:"storefront_id")
  String? storefrontId="";

  ShippingMethodRequest.empty();

  ShippingMethodRequest(
      this.currencyCode,
      this.gc,
      this.langCode,
      this.profileId,
      this.updateUserData,
      this.view,
      this.storefrontId);

  factory ShippingMethodRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodRequestToJson(this);


}

