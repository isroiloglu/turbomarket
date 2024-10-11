import 'package:json_annotation/json_annotation.dart';


part 'guestUserData.g.dart';

@JsonSerializable()
class GuestUserData {

  GuestUserData.empty();

  @JsonKey(name: "b_address")
  String? bAddress="";

  @JsonKey(name: "s_state")
  String? sState="";

  @JsonKey(name: "s_phone")
  String? sPhone="";

  @JsonKey(name: "s_lastname")
  String? sLastname="";

  @JsonKey(name: "s_firstname")
  String? sFirstname="";

  @JsonKey(name: "s_country")
  String? sCountry="";

  @JsonKey(name: "s_city")
  String? sCity="";

  @JsonKey(name: "s_address")
  String? sAddress="";

  @JsonKey(name: "b_zipcode")
  String? bZipcode="";

  @JsonKey(name: "b_state")
  String? bState="";

  @JsonKey(name: "b_phone")
  String? bPhone="";

  @JsonKey(name: "b_lastname")
  String? bLastname="";

  @JsonKey(name: "b_firstname")
  String? bFirstname="";

  @JsonKey(name: "b_email")
  String? bEmail="";

  @JsonKey(name: "b_country")
  String? bCountry="";

  @JsonKey(name: "b_city")
  String? bCity="";

  @JsonKey(name: "s_zipcode")
  String? sZipcode="";

  @JsonKey(name: "ship_to_another")
  int? shipToAnother=0;

  @JsonKey(name: "user_id")
  String? userId="";

  GuestUserData(
      this.bAddress,
      this.sState,
      this.sPhone,
      this.sLastname,
      this.sFirstname,
      this.sCountry,
      this.sCity,
      this.sAddress,
      this.bZipcode,
      this.bState,
      this.bPhone,
      this.bLastname,
      this.bFirstname,
      this.bEmail,
      this.bCountry,
      this.bCity,
      this.sZipcode,
      this.shipToAnother,
      this.userId);

  factory GuestUserData.fromJson(Map<String, dynamic> json) =>
      _$GuestUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$GuestUserDataToJson(this);
}
