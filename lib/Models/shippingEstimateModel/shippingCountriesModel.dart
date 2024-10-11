import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/shippingStatesModel.dart';
part 'shippingCountriesModel.g.dart';

@JsonSerializable()
class ShippingCountriesModel{

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "code_A3")
  String? codeA3;

  @JsonKey(name: "code_N3")
  String? codeN3;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "region")
  String? region;

  @JsonKey(name: "country")
  String? country;

  @JsonKey(name: "states")
  List<ShippingStatesModel>? states;


  ShippingCountriesModel({this.code,this.codeA3,this.codeN3,this.status,this.region,this.states});


  factory ShippingCountriesModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingCountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingCountriesModelToJson(this);

}