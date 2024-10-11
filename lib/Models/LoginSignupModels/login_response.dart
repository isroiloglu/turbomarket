import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/LoginSignupModels/wallet_data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name:"user_id")
  dynamic userId;
  @JsonKey(name:"company_id")
  String? companyId;
  @JsonKey(name:"user_type")
  String? userType;
  @JsonKey(name:"firstname")
  String? firstname;
  @JsonKey(name:"lastname")
  String? lastname;
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"multiple_profile_enable")
  bool? multipleProfileEnable;
  @JsonKey(name:"product_total")
  int? productTotal;
  @JsonKey(name:"is_vendor")
  bool? isVendor;
  @JsonKey(name:"wallet_data")
  WalletData? walletData;
  @JsonKey(name:"msg")
  String? message;
  @JsonKey(name:"error")
  bool? error;

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"points")
  int? points;

  LoginResponse.empty();

  LoginResponse(
      {this.userId,
        this.companyId,
        this.userType,
        this.firstname,
        this.lastname,
        this.email,
        this.multipleProfileEnable,
        this.productTotal,this.isVendor,this.walletData,this.message,this.error,this.points,this.phone});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Genders {
  List<Gender>? gender;

  Genders({this.gender});

  factory Genders.fromJson(Map<String, dynamic> json) =>
      _$GendersFromJson(json);
}

@JsonSerializable()
class Gender {
  @JsonKey(defaultValue: "")
  String? id;
  @JsonKey(defaultValue: "")
  String? name;

  Gender({
    this.id,
    this.name,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
}

