import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/countryList.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/profiles.dart';

part 'accountDetailResponse.g.dart';

@JsonSerializable()
class AccountDetailResponse{
  @JsonKey(name:"success")
  bool? success;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"user_id")
  String? userId;

  @JsonKey(name:"status")
  String? status;

  @JsonKey(name:"user_type")
  String? userType;

  @JsonKey(name:"is_root")
  String? isRoot;

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"firstname")
  String? firstName;

  @JsonKey(name:"lastname")
  String? lastName;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"profiles")
  List<Profiles>? profileList;

  @JsonKey(name: "multiple_profile_enable")
  bool? multipleProfileEnable;

  @JsonKey(name:"country_list")
  List<CountryList>? countryList;

  AccountDetailResponse(
      this.success,
      this.userId,
      this.status,
      this.userType,
      this.isRoot,
      this.companyId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.profileList,
      this.multipleProfileEnable,
      this.countryList,this.message);


  factory AccountDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailResponseToJson(this);
}


