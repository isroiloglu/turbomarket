import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/stateData.dart';
part 'countryList.g.dart';

@JsonSerializable()
class CountryList{


  @JsonKey(name:"country_code")
  String? countryCode;

  @JsonKey(name:"country_name")
  String? countryName;

  @JsonKey(name:"state_list")
  List<StateData>? stateList;

  CountryList(this.countryCode, this.countryName, this.stateList);

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}