import 'package:json_annotation/json_annotation.dart';
part 'value_multiple.g.dart';

@JsonSerializable()
class ValueMultiple {

  @JsonKey(name:"value")
  String? value;

  ValueMultiple({
   this.value,
  });

  factory ValueMultiple.fromJson(Map<String, dynamic> json) =>
      _$ValueMultipleFromJson(json);

  Map<String, dynamic> toJson() => _$ValueMultipleToJson(this);
}