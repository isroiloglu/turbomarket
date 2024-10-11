import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderListModel/params.dart';

import 'order.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel{

  @JsonKey(name:"orders")
  List<Order>? orders;

  @JsonKey(name:"params")
  OrderParams? params;

  OrderModel(this.orders, this.params);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}