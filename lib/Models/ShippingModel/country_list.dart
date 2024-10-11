

import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/state_list.dart';
part 'country_list.g.dart';

@JsonSerializable()
class CountryList {
  @JsonKey(name:"country_code")
  String? countryCode;

  @JsonKey(name:"country_name")
  String? countryName;

  @JsonKey(name:"state_list")
  List<StateList> stateList;

  @JsonKey(name:"coutry_code")
  String? coutryCode;

  CountryList(
      {this.countryCode, this.countryName, required this.stateList, this.coutryCode});

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListToJson(this);

}


