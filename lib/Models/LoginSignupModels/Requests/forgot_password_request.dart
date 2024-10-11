import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"forget_password")
  bool? forgotPassword;
  @JsonKey(name:"lang_code")
  String? languageCode;
  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  ForgotPasswordRequest(
      {
        this.email,
        this.forgotPassword,
        this.languageCode,this.currencyCode,this.storefrontId});

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}