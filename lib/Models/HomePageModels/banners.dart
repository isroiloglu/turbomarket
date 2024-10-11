import 'package:json_annotation/json_annotation.dart';
part 'banners.g.dart';


@JsonSerializable()
class Banners{

  @JsonKey(name:"image_path")
  String? imagePath;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"type")
  String? type;

  @JsonKey(name:"id")
  String? id;


  Banners(this.imagePath, this.name, this.type, this.id);

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);

  Map<String, dynamic> toJson() => _$BannersToJson(this);


}