import 'package:json_annotation/json_annotation.dart';

part 'profiles.g.dart';

@JsonSerializable()
class Profiles{


  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"profile_name")
  String? profileName;

  @JsonKey(name:"profile_type")
  String? profileType;

  @JsonKey(name:"b_firstname")
  String? bFirstname;

  @JsonKey(name:"b_lastname")
  String? bLastname;

  @JsonKey(name:"b_address")
  String? bAddress;

  @JsonKey(name:"b_city")
  String? bCity;

  @JsonKey(name:"b_phone")
  String? bPhone;

  @JsonKey(name:"s_firstname")
  String? sFirstname;

  @JsonKey(name:"s_lastname")
  String? sLastname;

  @JsonKey(name:"s_address")
  String? sAddress;

  @JsonKey(name:"s_city")
  String? sCity;

  @JsonKey(name:"s_state")
  String? sState;

  @JsonKey(name:"s_country")
  String? sCountry;

  @JsonKey(name:"s_zipcode")
  String? sZipcode;

  @JsonKey(name:"s_phone")
  String? sPhone;

  @JsonKey(name:"b_state")
  String? bState;

  @JsonKey(name:"b_country")
  String? bCountry;

  @JsonKey(name:"b_zipcode")
  String? bZipcode;

  Profiles.empty() ;

  Profiles(
      this.id,
      this.profileName,
      this.profileType,
      this.bFirstname,
      this.bLastname,
      this.bAddress,
      this.bCity,
      this.bPhone,
      this.sFirstname,
      this.sLastname,
      this.sAddress,
      this.sCity,
      this.sState,
      this.sCountry,
      this.sZipcode,
      this.sPhone,
      this.bState,
      this.bCountry,
      this.bZipcode);

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesToJson(this);
}


