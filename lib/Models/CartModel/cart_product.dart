import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/cart_product_option.dart';

import '../ProductDetailModels/response/product_option.dart';
part 'cart_product.g.dart';
@JsonSerializable()
class CartProduct{
  @JsonKey(name: "company_id")
  dynamic companyId;
  String? company;
  @JsonKey(name: "product_id")
  dynamic productId;
  String? product;
  @JsonKey(name: "product_code")
  String? productCode;
  @JsonKey(name: "product_options")
  List<CartProductOption>? productOptions;
  @JsonKey(name: "amount")
  dynamic? qty;
  @JsonKey(name: "min_qty")
  String? minQty;
  @JsonKey(name: "max_qty")
  String? maxQty;
  @JsonKey(name: "qty_step")
  String? qtyStep;
  @JsonKey(name: "item_id")
  dynamic itemId;
  @JsonKey(name: "is_update_allow")
  bool? isUpdateAllow;
  @JsonKey(name: "image_path")
  String? imagePath;
  @JsonKey(name: "display_price")
  double? displayPrice;
  @JsonKey(name: "format_display_price")
  dynamic formatDisplayPrice;
  @JsonKey(name: "subtotal")
  double? subtotal;
  @JsonKey(name: "format_subtotal")
  dynamic formatSubtotal;
  @JsonKey(name: "price_in_points")
  int? priceInPoints;
  @JsonKey(name: "reward_points")
  int? rewardPoints;
  bool? cartItemQtyChanged;

  CartProduct({this.product, this.subtotal, this.qty, this.productId, this.cartItemQtyChanged, this.company, this.companyId, this.displayPrice, this.formatDisplayPrice, this.formatSubtotal, this.imagePath, this.isUpdateAllow, this.itemId, this.productCode, this.productOptions,this.qtyStep,this.minQty,this.maxQty,this.rewardPoints,this.priceInPoints});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);


}