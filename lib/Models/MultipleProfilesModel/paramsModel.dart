import 'package:json_annotation/json_annotation.dart';
part 'paramsModel.g.dart';

@JsonSerializable()
class Params{
  @JsonKey(name: "users")
  String? ajaxCustom;

  @JsonKey(name: "params")
  String? userId;

  Params({this.ajaxCustom, this.userId});


  factory Params.fromJson(Map<String, dynamic> json) =>
      _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}