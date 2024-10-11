import 'package:json_annotation/json_annotation.dart';
part 'bannerPages.g.dart';


@JsonSerializable()
class BannerPages{

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "id")
  String? id;

@JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;


  BannerPages(this.description, this.id, this.title, this.image);


  factory BannerPages.fromJson(Map<String, dynamic> json) =>
      _$BannerPagesFromJson(json);

  Map<String, dynamic> toJson() => _$BannerPagesToJson(this);
}