import 'package:json_annotation/json_annotation.dart';
part 'brands.g.dart';

@JsonSerializable()
class Brands{

  @JsonKey(name: "variant_id")
  String? variantId;


  @JsonKey(name: "variant")
  String? variant;

  @JsonKey(name: "image_path")
  String? imagePath;

  Brands(this.variantId, this.variant, this.imagePath);

  factory Brands.fromJson(Map<String, dynamic> json) =>
      _$BrandsFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsToJson(this);
}