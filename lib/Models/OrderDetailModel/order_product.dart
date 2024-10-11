import 'package:json_annotation/json_annotation.dart';
part 'order_product.g.dart';

@JsonSerializable()

class OrderProduct{
  @JsonKey(name:"product_id")
  
  dynamic productId;

  @JsonKey(name:"product_code")
  
  String? productCode;
  @JsonKey(name:"product")
  
  String? product;
  @JsonKey(name:"amount")

  dynamic amount;
//    @JsonKey(name:("product_options")
//    
//    List<Object> productOptions = null;
  @JsonKey(name:"price")
  
  double? price;
  @JsonKey(name:"formatprice")
  
  String? formatPrice;
  @JsonKey(name:"subtotal")
  
  String? subtotal;

  @JsonKey(name:"price_in_points")
  
  int? priceInPoints;
  @JsonKey(name:"image_path")
  
  String? imagePath;

  OrderProduct(
      this.productId,
      this.productCode,
      this.product,
      this.amount,
      this.price,
      this.formatPrice,
      this.subtotal,
      this.priceInPoints,
      this.imagePath);

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}