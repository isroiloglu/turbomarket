import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';
part 'shippingEstimateRequest.g.dart';

@JsonSerializable()
class ShippingEstimateRequest{

  @JsonKey(name: "countries")
  bool? isCountry;

  @JsonKey(name: "lang_code")
  String? languageCode;

  ShippingEstimateRequest({this.isCountry, this.languageCode});


  factory ShippingEstimateRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingEstimateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingEstimateRequestToJson(this);

}