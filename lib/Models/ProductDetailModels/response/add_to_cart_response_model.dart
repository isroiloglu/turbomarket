import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_response_model.g.dart';


@JsonSerializable()
class AddToCartResponseModel {
  @JsonKey(name: "msg")
  String? msg;

  @JsonKey(name: "error")
  bool? error;

  @JsonKey(name: "product_total")
  Object? productTotal;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "g_id")
  String? gId;

  @JsonKey(name: "item_id")
  String? itemId;

  @JsonKey(name: "warning")
  bool? warning;

  AddToCartResponseModel({
    this.msg,
    this.error,
    this.productTotal,
    this.success,
    this.gId,
    this.itemId,
    this.warning,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseModelToJson(this);
}
