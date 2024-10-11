import 'package:json_annotation/json_annotation.dart';

part 'wishlist_data.g.dart';

@JsonSerializable()
class WishlistData {
  @JsonKey(name:"product_id")
  
  int? productId;
  @JsonKey(name:"item_id")
  
  String? itemId;
  @JsonKey(name:"product")
  
  String? product;
  @JsonKey(name:"price")
  

  dynamic price;
  @JsonKey(name:"formatprice")
  
  String? formatPrice;
  @JsonKey(name:"list_price")
  
  double? listPrice;
  @JsonKey(name:"formatlist_price")
  
  String? formatListPrice;
  @JsonKey(name:"image")
  
  String? imagePath;

  @JsonKey(name:"inStock")
  bool? inStock;

  @JsonKey(name:"backOrder")
  bool? backOrder;

  @JsonKey(name:"outOfStock")
  bool? outOfStock;

  @JsonKey(name: "is_discount")
  bool? isDiscount;

  @JsonKey(name: 'discount')
  double? discount;



  WishlistData(this.productId, this.itemId, this.product, this.price,
      this.formatPrice, this.listPrice, this.formatListPrice, this.imagePath, this.isDiscount, this.discount, this.outOfStock, this.backOrder, this.inStock);

  factory WishlistData.fromJson(Map<String, dynamic> json) =>
      _$WishlistDataFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistDataToJson(this);
}
