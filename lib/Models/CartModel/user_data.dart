import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';
@JsonSerializable()
class UserData{
  String? email;


UserData({this.email});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}