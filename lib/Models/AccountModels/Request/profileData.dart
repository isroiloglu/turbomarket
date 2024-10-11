import 'package:json_annotation/json_annotation.dart';
part 'profileData.g.dart';

@JsonSerializable()
class ProfileData{
  ProfileData.empty();
  @JsonKey(name:"b_address")
  String? bAddress;

  @JsonKey(name:"s_state")
  String? sState;

  @JsonKey(name:"s_phone")
  String? sPhone;

  @JsonKey(name:"s_lastname")
  String? sLastname;

  @JsonKey(name:"s_firstname")
  String? sFirstname;

  @JsonKey(name:"s_country")
  String? sCountry;

  @JsonKey(name:"s_city")
  String? sCity;

  @JsonKey(name:"s_Address")
  String? sAddress;

  @JsonKey(name:"profile_name")
  String? profileName;

  @JsonKey(name:"profile_mailing_list_1")
  bool? profileMailingLis1;

  @JsonKey(name:"b_zipcode")
  String? bZipcode;

  @JsonKey(name:"b_state")
  String? bState;

  @JsonKey(name:"b_phone")
  String? bPhone;

  @JsonKey(name:"b_lastname")
  String? bLastname;

  @JsonKey(name:"b_firstname")
  String? bFirstname;

  @JsonKey(name:"b_city")
  String? bCity;

  @JsonKey(name:"b_country")
  String? bCountry;

  @JsonKey(name:"s_zipcode")
  String? sZipcode;

  @JsonKey(name:"ship_to_another")
  int? shipToAnother;

  @JsonKey(name:"user_id")
  String? userId;



  @JsonKey(name:"b_email", defaultValue: "")
  String? bEmail;

  ProfileData(
      this.bAddress,
      this.sState,
      this.sPhone,
      this.sLastname,
      this.sFirstname,
      this.sCountry,
      this.sCity,
      this.sAddress,
      this.profileName,
      this.profileMailingLis1,
      this.bZipcode,
      this.bState,
      this.bPhone,
      this.bLastname,
      this.bFirstname,
      this.bCity,
      this.bCountry,
      this.sZipcode,
      this.shipToAnother,
      this.userId,this.bEmail);

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

