import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterAccountRequest {
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"g_id")
  String? guestId;
  @JsonKey(name:"password1")
  String? password;
  @JsonKey(name:"password2")
  String? confirmPassword;
  @JsonKey(name:"user_type")
  String? customerType;
  @JsonKey(name:"company_id")
  String? companyId;
  @JsonKey(name:"lang_code")
  String? languageCode="";
  @JsonKey(name:"currency_code")
  String? currencyCode="";

  @JsonKey(name:"chat_token")
  String? chatToken;

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  RegisterAccountRequest(
      {this.email,
      this.guestId,
      this.password,
      this.confirmPassword,
      this.customerType,
      this.companyId,
      this.languageCode,
      this.currencyCode,
      this.chatToken,this.phone,this.storefrontId});

  factory RegisterAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAccountRequestToJson(this);
}
