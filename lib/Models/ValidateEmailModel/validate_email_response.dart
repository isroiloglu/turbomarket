import 'package:json_annotation/json_annotation.dart';
part 'validate_email_response.g.dart';


@JsonSerializable()
class ValidateEmailResponse{


  @JsonKey(name:"success")
  bool success=false;

  @JsonKey(name:"message")
  String message="";

  ValidateEmailResponse(this.success, this.message);

  factory ValidateEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateEmailResponseToJson(this);
}