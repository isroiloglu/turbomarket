import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/product_item.dart';
part 'homeCategoryProduct.g.dart';


@JsonSerializable()
class HomeCategoryProduct{

  @JsonKey(name: "category_id")
  String? categoryId;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "products")
  List<ProductItem>? products;

  HomeCategoryProduct(this.categoryId, this.title, this.products);


  factory HomeCategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryProductFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryProductToJson(this);
}