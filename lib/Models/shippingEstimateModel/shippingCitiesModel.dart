import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';
part 'shippingCitiesModel.g.dart';

@JsonSerializable()
class ShippingCitiesModel{

  @JsonKey(name: "city_id")
  String? cityId;

  @JsonKey(name: "country_code")
  String? countryCode;

  @JsonKey(name: "state_code")
  String? stateCode;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "city")
  String? city;


  ShippingCitiesModel({this.cityId,this.countryCode,this.stateCode,this.status,this.city});


  factory ShippingCitiesModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingCitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingCitiesModelToJson(this);

}