import 'package:json_annotation/json_annotation.dart';
part 'countries.g.dart';

@JsonSerializable()
class Countries{

  @JsonKey(name: "dc_code")
  String? dcCode;


  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "title")
  String? title;

  Countries(this.dcCode, this.id, this.image, this.title);

  factory Countries.fromJson(Map<String, dynamic> json) =>
      _$CountriesFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}