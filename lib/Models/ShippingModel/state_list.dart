import 'package:json_annotation/json_annotation.dart';
part 'state_list.g.dart';


@JsonSerializable()
class StateList {

  @JsonKey(name:"state_code")
  dynamic stateCode;

  @JsonKey(name:"state_name")
  String? stateName;

  StateList({this.stateCode, this.stateName});


  factory StateList.fromJson(Map<String, dynamic> json) =>
      _$StateListFromJson(json);

  Map<String, dynamic> toJson() => _$StateListToJson(this);

}
