import 'package:json_annotation/json_annotation.dart';

part 'social_login_request.g.dart';

@JsonSerializable()
class SocialLoginRequest {
  @JsonKey(name:"company_id")
  String? companyId="";
  @JsonKey(name:"firstname")
  String? firstName="";
  @JsonKey(name:"lastname")
  String? lastName="";
  @JsonKey(name:"email")
  String? email="";
  @JsonKey(name:"g_id")
  String? guestId="";
  @JsonKey(name:"lang_code")
  String? languageCode="";
  @JsonKey(name:"currency_code")
  String? currencyCode="";
  @JsonKey(name:"chat_token")
  String? chatToken="";

  @JsonKey(name:"storefront_id")
  String? storefrontId="";

  SocialLoginRequest(
      {
        this.companyId,
        this.firstName,
        this.lastName,
        this.email,
        this.guestId,
        this.languageCode,
        this.currencyCode,this.chatToken,this.storefrontId});

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLoginRequestToJson(this);
}