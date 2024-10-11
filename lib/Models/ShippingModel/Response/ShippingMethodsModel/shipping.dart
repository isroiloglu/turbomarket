import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';

part 'shipping.g.dart';


@JsonSerializable()
class Shipping{

  @JsonKey(name:"shipping_methods")
  List<shippingMethods> shippingMethodList;

  @JsonKey(name:"is_shipping_required")
  bool? isShippingRequired=false;

  Shipping(this.shippingMethodList,this.isShippingRequired);


  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}