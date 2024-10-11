import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/WishlistModel/wishlist_data.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class WishlistModel {
  @JsonKey(name: "wishlist_data")
  List<WishlistData>? wishlistData;

  @JsonKey(name: "error")
  bool? error;

  @JsonKey(name: "msg")
  String? msg;

  int? wishListSize;

  WishlistModel.empty();

  WishlistModel(this.wishlistData, this.error, this.msg, this.wishListSize);
  factory WishlistModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistModelToJson(this);
}
