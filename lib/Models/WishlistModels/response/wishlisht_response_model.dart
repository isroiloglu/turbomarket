import 'package:json_annotation/json_annotation.dart';
part 'wishlisht_response_model.g.dart';

@JsonSerializable()
class WishListResponseModel{

  @JsonKey(name: "error")
  bool? error;


  @JsonKey(name: "item_id")
  Object? itemId;


  @JsonKey(name: "msg")
  String? msg;


  @JsonKey(name: "product_count")
  String? productCount;

  @JsonKey(name:"g_id")
  String? gId;

  WishListResponseModel(this.error, this.itemId, this.msg, this.productCount,this.gId);


  factory WishListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WishListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishListResponseModelToJson(this);
}