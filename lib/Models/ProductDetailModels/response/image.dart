import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class ProductImage{
  @JsonKey(name: "main")
  String? main;
  @JsonKey(name: "thumb")
  String? thumb;

  ProductImage({this.main, this.thumb});

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}