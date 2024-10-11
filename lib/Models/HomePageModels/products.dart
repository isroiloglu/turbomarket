import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/bannerPages.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/categories.dart';

import 'countries.dart';
import 'homeCategoryProduct.dart';
import 'product_item.dart';
part 'products.g.dart';

@JsonSerializable()
class Products{

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name:"dc_code")
  String? dcCode;

  @JsonKey(name:"image_visible")
  bool? imageVisible;

  @JsonKey(name:"type")
  String? type;

  @JsonKey(name: "product_list")
  List<ProductItem>? productList;

  @JsonKey(name: "countries")
  List<Countries>? countries;

  @JsonKey(name: "pages")
  List<BannerPages>? pages;

  @JsonKey(name: "products")
  List<ProductItem>? products;

  @JsonKey(name: "categories")
  List<HomeCategoryProduct>? categories;




  Products(this.title, this.image, this.id, this.productList);


  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}