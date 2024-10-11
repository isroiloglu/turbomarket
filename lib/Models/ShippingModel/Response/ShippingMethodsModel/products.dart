
import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';

@JsonSerializable()
class Products{

  @JsonKey(name:"product")
  String product="";

  @JsonKey(name:"product_id")
  String productId="";

  Products(this.product, this.productId);

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}