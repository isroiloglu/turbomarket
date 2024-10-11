import 'package:json_annotation/json_annotation.dart';

import '../HomePageModels/product_item.dart';
part 'home_page_product_data.g.dart';

@JsonSerializable()
class HomePageProductData{

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "product_list")
  List<ProductItem>? productList;

  HomePageProductData(this.title, this.image, this.id, this.productList);

  factory HomePageProductData.fromJson(Map<String, dynamic> json) =>
      _$HomePageProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageProductDataToJson(this);

}