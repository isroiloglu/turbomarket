
import 'package:json_annotation/json_annotation.dart';
part 'stateData.g.dart';


@JsonSerializable()
class StateData{

  @JsonKey(name:"state_code")
  String? stateCode;

  @JsonKey(name:"state_name")
  String? stateName;

  StateData(this.stateCode, this.stateName);

  factory StateData.fromJson(Map<String, dynamic> json) =>
      _$StateDataFromJson(json);

  Map<String, dynamic> toJson() => _$StateDataToJson(this);
}