import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/Reviews/reviewRequestData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/shippingCitiesModel.dart';
part 'shippingStatesModel.g.dart';

@JsonSerializable()
class ShippingStatesModel{

  @JsonKey(name: "code")
  dynamic? code;

  @JsonKey(name: "state")
  String? state;

  @JsonKey(name: "cities")
  List<ShippingCitiesModel>? cities;


  ShippingStatesModel({this.code,this.state,this.cities});


  factory ShippingStatesModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingStatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingStatesModelToJson(this);

}