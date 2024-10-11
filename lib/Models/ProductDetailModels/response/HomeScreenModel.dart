import 'package:json_annotation/json_annotation.dart';

part 'HomeScreenModel.g.dart';


@JsonSerializable()
class Product {
  int? id;
  String? brand;
  String? name;
  String? price;
  @JsonKey(name: "image_link")
  String? imageLink;
  String? description;
  double? rating;

  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.imageLink,
    this.description,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
