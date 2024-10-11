
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shippingStoreModel.dart';
part 'shipping_method.g.dart';

@JsonSerializable()
class shippingMethods{


  @JsonKey(name:"shipping_id")
  String? shippingId;

  @JsonKey(name:"shipping")
  String? shipping;

  @JsonKey(name:"delivery_time")
  String? deliveryTime;

  @JsonKey(name:"rate")
  String? rate;

  @JsonKey(name:"description")
  String? description;


  @JsonKey(name:"free_shipping")
  bool freeShipping=false;

  @JsonKey(name:"stores")
  List<ShippingStoreModel>? stores;

  shippingMethods.empty();

  shippingMethods(this.shippingId, this.shipping, this.deliveryTime, this.rate,
      this.description, this.freeShipping,this.stores);

  factory shippingMethods.fromJson(Map<String, dynamic> json) =>
      _$shippingMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$shippingMethodsToJson(this);
}