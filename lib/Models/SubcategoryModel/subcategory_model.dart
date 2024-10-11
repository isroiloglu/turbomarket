
import 'package:json_annotation/json_annotation.dart';

import '../HomePageModels/categories.dart';
part 'subcategory_model.g.dart';

@JsonSerializable()
class SubCategoryModel{


  @JsonKey(name: "categories")
  List<Categories>? categories;

  SubCategoryModel(this.categories);



  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}