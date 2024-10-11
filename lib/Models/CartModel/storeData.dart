import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/tax_summary.dart';

import '../ShippingModel/Request/user_data.dart';
import 'applied_promotions.dart';
import 'cart_product.dart';
part 'storeData.g.dart';
@JsonSerializable()
class StoreData{
  @JsonKey(name: 'store_address')
  String? storeAddress;

  @JsonKey(name:"store_Id")
  String? storeId;

  @JsonKey(name:"store_name")
  String? storeName;

  @JsonKey(name:"store_phone")
  String? storePhone;

  @JsonKey(name:"store_item")
  String? storeItem;


  StoreData({this.storeAddress, this.storeId, this.storeItem, this.storeName, this.storePhone});

  factory StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}