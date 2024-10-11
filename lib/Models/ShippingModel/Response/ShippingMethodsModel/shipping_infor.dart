
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';

import '../../../HomePageModels/products.dart';
part 'shipping_infor.g.dart';


@JsonSerializable()
class ShippingInfo{

  @JsonKey(name:"company_id")
  int companyId=0;

  @JsonKey(name:"company")
  String company="";

  @JsonKey(name:"products")
  List<Products>? productList;

  @JsonKey(name:"show_text")
  bool showText=false;

  @JsonKey(name:"is_shipping_required")
  bool isShippingRequired=false;

  @JsonKey(name:"shipping_text")
  String shippingText="";

  @JsonKey(name:"shipping_methods")
  List<shippingMethods>? shippingMethodList;

  ShippingInfo(this.companyId, this.company, this.productList, this.showText,
      this.isShippingRequired, this.shippingText, this.shippingMethodList);

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}