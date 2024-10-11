import 'package:json_annotation/json_annotation.dart';
part 'updateProfileRequest.g.dart';

@JsonSerializable()
class UpdateProfileRequest{


  @JsonKey(name: "b_address")
  String? bAddress;

  @JsonKey(name: "profile_id")
  String? profileId;

  @JsonKey(name: "password1")
  String? password1;

  @JsonKey(name: "lang_code")
  String? langCode;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "password2")
  String? password2;

  @JsonKey(name: "company_id")
  String? companyId;

  @JsonKey(name: "s_state")
  String? sState;

  @JsonKey(name: "s_phone")
  String? sPhone;

  @JsonKey(name: "s_lastname")
  String? sLastName;

  @JsonKey(name: "s_firstname")
  String? sFirstName;

  @JsonKey(name: "s_city")
  String? sCity;

  @JsonKey(name: "s_country")
  String? sCountry;

  @JsonKey(name: "b_state")
  String? bState;

  @JsonKey(name: "b_phone")
  String? bPhone;

  @JsonKey(name: "b_lastname")
  String? bLastname;

  @JsonKey(name: "b_firstname")
  String? bFirstname;

  @JsonKey(name: "b_city")
  String? bCity;

  @JsonKey(name: "b_country")
  String? bCountry;

  @JsonKey(name: "profile_name")
  String? profileName;

  @JsonKey(name: "select_gdpr_agreement")
  String? selectGdprAgreement;

  @JsonKey(name: "ship_to_another")
  int? shipToAnother;

  @JsonKey(name: "user_id")
  String? userId;

  @JsonKey(name: "user_type")
  String? userType;

  @JsonKey(name: "phone")
  String? phone;

  UpdateProfileRequest.empty();

  @JsonKey(name: "b_zipcode")
  String? bZipcode;

  @JsonKey(name: "s_zipcode")
  String? sZipcode;

  @JsonKey(name: "s_address")
  String? sAddress;

  @JsonKey(name: "storefront_id")
  String? storefrontId;


  UpdateProfileRequest(
      this.bAddress,
      this.profileId,
      this.password1,
      this.langCode,
      this.email,
      this.password2,
      this.companyId,
      this.sState,
      this.sPhone,
      this.sLastName,
      this.sFirstName,
      this.sCity,
      this.sCountry,
      this.bState,
      this.bPhone,
      this.bLastname,
      this.bFirstname,
      this.bCity,
      this.bCountry,
      this.profileName,
      this.selectGdprAgreement,
      this.shipToAnother,
      this.userId,
      this.userType,this.phone,this.bZipcode,this.sZipcode,this.sAddress,this.storefrontId);


  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}



