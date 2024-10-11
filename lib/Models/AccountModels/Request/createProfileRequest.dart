import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/profileData.dart';
part 'createProfileRequest.g.dart';

@JsonSerializable()
class CreateProfileRequest{

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"user_data")
  ProfileData? userData;

  @JsonKey(name: "storefront_id")
  String? storefrontId;

  CreateProfileRequest(this.langCode, this.userData,this.storefrontId);
  CreateProfileRequest.empty();

  factory CreateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProfileRequestToJson(this);
}