import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MultipleProfilesModel/paramsModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MultipleProfilesModel/profileUserModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../AccountModels/Response/countryList.dart';
part 'multipleProfileResponse.g.dart';

@JsonSerializable()
class MultipleProfilesResponse extends BaseResponse{
  @JsonKey(name: "users")
  List<ProfileUserModel>? users;

  @JsonKey(name: "params")
  Params? params;

  @JsonKey(name:"countries")
  List<CountryList>? countryList;

  MultipleProfilesResponse({this.users, this.params});


  factory MultipleProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$MultipleProfilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleProfilesResponseToJson(this);
}