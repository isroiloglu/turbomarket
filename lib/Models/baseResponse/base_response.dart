import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "error")
  dynamic error;

  @JsonKey(name: "msg")
  String? msg;


  BaseResponse({this.success, this.message, this.error});


  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

