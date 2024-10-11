import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';

import '../shippingCountriesModel.dart';
part 'shippingEstimateResponse.g.dart';

@JsonSerializable()
class ShippingEstimateResponse{

  @JsonKey(name: "countries")
  List<ShippingCountriesModel>? countries;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "error")
  bool? error;

  @JsonKey(name: "msg")
  String? msg;


  ShippingEstimateResponse({this.countries, this.success,this.error,this.msg});


  factory ShippingEstimateResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingEstimateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingEstimateResponseToJson(this);

}