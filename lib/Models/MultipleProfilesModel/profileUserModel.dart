import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profileUserModel.g.dart';

@JsonSerializable()
class ProfileUserModel extends BaseResponse{
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "user_type")
  String? userType;
  @JsonKey(name: "user_login")
  String? userLogin;
  @JsonKey(name: "referer")
  String? referer;
  @JsonKey(name: "is_root")
  String? isRoot;
  @JsonKey(name: "company_id")
  String? companyId;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "company")
  String? company;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "fax")
  String? fax;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "tax_exempt")
  String? taxExempt;
  @JsonKey(name: "lang_code")
  String? langCode;
  @JsonKey(name: "external_id")
  String? externalId;
  @JsonKey(name: "applied_promotion")
  String? appliedPromotion;
  @JsonKey(name: "profile_id")
  String? profileId;
  @JsonKey(name: "profile_type")
  String? profileType;
  @JsonKey(name: "b_firstname")
  String? bFirstname;
  @JsonKey(name: "b_lastname")
  String? bLastname;
  @JsonKey(name: "b_address")
  String? bAddress;
  @JsonKey(name: "b_address_2")
  String? bAddress2;
  @JsonKey(name: "b_city")
  String? bCity;
  @JsonKey(name: "b_state")
  String? bState;
  @JsonKey(name: "b_country")
  String? bCountry;
  @JsonKey(name: "b_zipcode")
  String? bZipcode;
  @JsonKey(name: "b_phone")
  String? bPhone;
  @JsonKey(name: "s_firstname")
  String? sFirstname;
  @JsonKey(name: "s_lastname")
  String? sLastname;
  @JsonKey(name: "s_address")
  String? sAddress;
  @JsonKey(name: "s_address_2")
  String? sAddress2;
  @JsonKey(name: "s_city")
  String? sCity;
  @JsonKey(name: "s_state")
  String? sState;
  @JsonKey(name: "s_country")
  String? sCountry;
  @JsonKey(name: "s_zipcode")
  String? sZipcode;
  @JsonKey(name: "s_phone")
  String? sPhone;
  @JsonKey(name: "s_address_type")
  String? sAddressType;
  @JsonKey(name: "profile_name")
  String? profileName;
  @JsonKey(name: "b_country_descr")
  String? bCountryDescr;
  @JsonKey(name: "s_country_descr")
  String? sCountryDescr;
  @JsonKey(name: "b_state_descr")
  String? bStateDescr;
  @JsonKey(name: "s_state_descr")
  String? sStateDescr;
  @JsonKey(name: "points")
  int? points;

  @JsonKey(name: "ship_to_another")
  int? shipToAnother;

   bool? isSelected;

  ProfileUserModel.empty();

  ProfileUserModel(
  {this.userId,
  this.status,
  this.userType,
  this.userLogin,
  this.referer,
  this.isRoot,
  this.companyId,
  this.password,
  this.firstname,
  this.lastname,
  this.company,
  this.email,
  this.phone,
  this.fax,
  this.url,
  this.taxExempt,
  this.langCode,
  this.externalId,
  this.appliedPromotion,
  this.profileId,
  this.profileType,
  this.bFirstname,
  this.bLastname,
  this.bAddress,
  this.bAddress2,
  this.bCity,
  this.bState,
  this.bCountry,
  this.bZipcode,
  this.bPhone,
  this.sFirstname,
  this.sLastname,
  this.sAddress,
  this.sAddress2,
  this.sCity,
  this.sState,
  this.sCountry,
  this.sZipcode,
  this.sPhone,
  this.sAddressType,
  this.profileName,
  this.bCountryDescr,
  this.sCountryDescr,
  this.bStateDescr,
  this.sStateDescr,
  this.points,this.isSelected,this.shipToAnother});


  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserModelToJson(this);
}