import 'package:json_annotation/json_annotation.dart';

import '../ProductDetailModels/response/comments.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(name: "product_id")
  String? productId;

  @JsonKey(name: "product")
  String? product;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "formatprice")
  dynamic formatPrice;

  @JsonKey(name: "list_price")
  double? listPrice;

  @JsonKey(name: "formatlist_price")
  dynamic formatListPrice;

  @JsonKey(name: "discount")
  double? discount;

  @JsonKey(name: "is_discount")
  bool? isDiscount;

  @JsonKey(name: "add_to_cart")
  bool? addToCart;

  @JsonKey(name: "product_in_wishlist")
  bool productInWishlist = false;

  @JsonKey(name: "images")
  List<String>? images;

  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "comments")
  Comments? comments;

  @JsonKey(name: "item_id")
  Object? itemId;

  @JsonKey(name: "dc_codes")
  List<String>? dcCodes;

  @JsonKey(name: "dc_code")
  String? dcCode;

  @JsonKey(name: "inStock")
  bool? inStock;

  @JsonKey(name: "backOrder")
  bool? backOrder;

  @JsonKey(name: "")
  bool? outOfStock;

  ProductItem(
      this.productId,
      this.product,
      this.price,
      this.formatPrice,
      this.listPrice,
      this.formatListPrice,
      this.discount,
      this.isDiscount,
      this.productInWishlist,
      this.images,
      this.comments,
      this.itemId,
      this.dcCodes,
      this.image,
      this.dcCode,
      this.addToCart,
      this.backOrder,
      this.inStock,
      this.outOfStock);

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
