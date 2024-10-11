import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping.dart';

import 'all_shipping.dart';

part 'shipping_method_model.g.dart';


@JsonSerializable()
class ShippingMethodModel{

  // @JsonKey(name:"global")
  // bool global=false;

  // @JsonKey(name:"global_text")
  // String globalText="";

  // @JsonKey(name:"cod_availability")
  // int codAvailability=0;
  //
  // @JsonKey(name:"product_total")
  // int productTotal=0;

  @JsonKey(name:"all_shippings")
  AllShipping? allShipping;

  @JsonKey(name:"shipping")
  Shipping? shipping;

  @JsonKey(name: "shipping_required")
  String? shippingRequired;

  @JsonKey(name:"msg")
  String? message;

  @JsonKey(name:"success")
  bool? success;

  @JsonKey(name:"error")
  bool? error;


  ShippingMethodModel(
      // this.global,
      // this.globalText,
      // this.codAvailability,
      // this.productTotal,
      this.allShipping,
      this.shipping,
      this.shippingRequired,
      this.message,
      this.success,this.error);

  factory ShippingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodModelToJson(this);
}