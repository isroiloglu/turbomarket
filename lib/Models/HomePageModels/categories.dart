import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories{

  @JsonKey(name: "category_id")
  String? categoryId;

  @JsonKey(name: "parent_id")
  String? parentId;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "position")
  String? position;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "company_id")
  String? companyId;

  @JsonKey(name: "has_children")
  String? hasChildren;

  @JsonKey(name: "subcategories")
  List<Categories>? subcategoryList;

  @JsonKey(name: "images")
  String? images;

  @JsonKey(name: "thumbnail")
  String? thumbnail;

  @JsonKey(name: "icon_images")
  String? iconImages;

  Categories(
      this.categoryId,
      this.parentId,
      this.category,
      this.position,
      this.status,
      this.companyId,
      this.hasChildren,
      this.subcategoryList,
      this.images,
      this.thumbnail,
      this.iconImages);


  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}