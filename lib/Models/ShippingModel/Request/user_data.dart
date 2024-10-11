import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData{

  @JsonKey(name:"b_address")
  String bAddress="";

  @JsonKey(name:"b_city")
  String bCity="";

  @JsonKey(name:"b_country")
  String bCountry="";

  @JsonKey(name:"b_email")
  String bEmail="";

  @JsonKey(name:"b_firstname")
  String bFirstname="";

  @JsonKey(name:"b_lastname")
  String bLastname="";

  @JsonKey(name:"b_phone")
  String bPhone="";

  @JsonKey(name:"b_state")
  String bState="";

  @JsonKey(name:"b_zipcode")
  String bZipcode="";

  @JsonKey(name:"profile_name")
  String profileName="";

  @JsonKey(name:"ship_to_another")
  int shipToAnother=0;

  @JsonKey(name:"user_id")
  String userId="";


  @JsonKey(name:"s_address")
  String sAddress="";

  @JsonKey(name:"s_city")
  String sCity="";

  @JsonKey(name:"s_country")
  String sCountry="";

  @JsonKey(name:"s_firstname")
  String sFirstname="";

  @JsonKey(name:"s_lastname")
  String sLastname="";

  @JsonKey(name:"s_phone")
  String sPhone="";

  @JsonKey(name:"s_state")
  String sState="";

  @JsonKey(name:"s_zipcode")
  String sZipcode="";

  UserData.empty();

  UserData(
      this.bAddress,
      this.bCity,
      this.bCountry,
      this.bEmail,
      this.bFirstname,
      this.bLastname,
      this.bPhone,
      this.bState,
      this.bZipcode,
      this.profileName,
      this.shipToAnother,
      this.userId,
      this.sAddress,
      this.sCity,
      this.sCountry,
      this.sFirstname,
      this.sLastname,
      this.sPhone,
      this.sState,
      this.sZipcode);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);



}


