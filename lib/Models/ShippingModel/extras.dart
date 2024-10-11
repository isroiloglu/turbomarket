import 'package:json_annotation/json_annotation.dart';
part 'extras.g.dart';

@JsonSerializable()
class Extra {

  @JsonKey(name:"default_country")
  String? defaultCountry;

  @JsonKey(name:"default_state")
  String? defaultState;

  Extra({this.defaultCountry, this.defaultState});

  factory Extra.fromJson(Map<String, dynamic> json) =>
      _$ExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}
