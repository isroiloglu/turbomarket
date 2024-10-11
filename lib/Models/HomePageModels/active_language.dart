import 'package:json_annotation/json_annotation.dart';
part 'active_language.g.dart';

@JsonSerializable()
class ActiveLanguages{

  @JsonKey(name: "lang_id")
  String? langId;

  @JsonKey(name: "lang_code")
  String? langCode;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "country_code")
  String? countryCode;

  @JsonKey(name: "direction")
  String? direction;


  ActiveLanguages(
      this.langId, this.langCode, this.name, this.countryCode, this.direction);

  factory ActiveLanguages.fromJson(Map<String, dynamic> json) =>
      _$ActiveLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveLanguagesToJson(this);

}


