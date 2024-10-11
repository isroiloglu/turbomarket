import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_infor.dart';
part 'all_shipping.g.dart';

@JsonSerializable()
class AllShipping{

  @JsonKey(name:"shipping_info")
  List<ShippingInfo> shippingInfoList;

  @JsonKey(name:"total_shipping_cost")
  String totalShippingCost="";

  AllShipping(this.shippingInfoList, this.totalShippingCost);

  factory AllShipping.fromJson(Map<String, dynamic> json) =>
      _$AllShippingFromJson(json);

  Map<String, dynamic> toJson() => _$AllShippingToJson(this);
}