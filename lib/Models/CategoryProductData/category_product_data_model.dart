
import 'package:json_annotation/json_annotation.dart';

import '../HomePageModels/params_product.dart';
import '../HomePageModels/product_filters.dart';
import '../HomePageModels/product_item.dart';
import '../HomePageModels/sorting.dart';
import 'home_page_product_data.dart';

part 'category_product_data_model.g.dart';


@JsonSerializable()
class CategoryProductsDataModel{


  @JsonKey(name: "products")
  List<ProductItem>? productList;

  @JsonKey(name: "promotion_products")
  List<ProductItem>? promotionProducts;
  @JsonKey(name: "sorting")
  List<Sorting>? sorting;
  @JsonKey(name: "filters")
  List<Filters>? filters;
  @JsonKey(name: "params")
  ProductParams? productParams;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "product_count")
  int? productCount;

  @JsonKey(name:"homepage_products")
  HomePageProductData? homePageProductData;

  CategoryProductsDataModel(this.productList,this.sorting,this.filters,this.productParams,this.homePageProductData, this.productCount, this.id, this.name, this.promotionProducts);

  factory CategoryProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductsDataModelToJson(this);

}