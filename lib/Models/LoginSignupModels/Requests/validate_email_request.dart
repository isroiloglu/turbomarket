
import 'package:json_annotation/json_annotation.dart';

part 'validate_email_request.g.dart';


@JsonSerializable()
class ValidateEmailRequest{

  @JsonKey(name:"email")
  String email="";

  ValidateEmailRequest(this.email);

  factory ValidateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateEmailRequestToJson(this);
}