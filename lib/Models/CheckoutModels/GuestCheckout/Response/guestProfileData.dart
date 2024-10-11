import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/countryList.dart';
part 'guestProfileData.g.dart';


@JsonSerializable()
class GuestProfileData{
  @JsonKey(name:"country_list")
  List<CountryList>? countryList;

  GuestProfileData(this.countryList);

  factory GuestProfileData.fromJson(Map<String, dynamic> json) =>
      _$GuestProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$GuestProfileDataToJson(this);
}