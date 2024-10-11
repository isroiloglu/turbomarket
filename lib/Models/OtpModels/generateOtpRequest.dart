
import 'package:json_annotation/json_annotation.dart';
part 'generateOtpRequest.g.dart';

@JsonSerializable()
class GenerateOtpRequest{

  @JsonKey(name:"phone")
 String? phone;

  @JsonKey(name:"action")
  String? action;

  @JsonKey(name:"lang_code")
  String? lang;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name: "otp")
  String? otp;


  GenerateOtpRequest({
    this.phone, this.action, this.currencyCode, this.lang, this.otp
});

  factory GenerateOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpRequestToJson(this);

}