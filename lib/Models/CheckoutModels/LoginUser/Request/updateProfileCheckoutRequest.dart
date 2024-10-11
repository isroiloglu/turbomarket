import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/profileData.dart';
part 'updateProfileCheckoutRequest.g.dart';


@JsonSerializable()
class UpdateProfileCheckoutRequest{

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"gc")
  String? gc;

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"profile_id")
  String? profileId;

  @JsonKey(name:"select_gdpr_agreement")
  String? selectGdprAgreement;

  @JsonKey(name:"update_user_data")
  String? updateUserData;

  @JsonKey(name:"user_data")
  ProfileData? userData;

  @JsonKey(name:"user_type")
  String? userType;

  @JsonKey(name:"view")
  String? view;


  @JsonKey(name:"ship_to_another")
  int? shipToAnother;

  @JsonKey(name:"display_subtotal")
  double? displaySubtotal;

  @JsonKey(name:"wallet_system")
  double? walletSystem;

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  UpdateProfileCheckoutRequest.empty();

  factory UpdateProfileCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileCheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileCheckoutRequestToJson(this);

  UpdateProfileCheckoutRequest(
      this.companyId,
      this.currencyCode,
      this.gc,
      this.langCode,
      this.profileId,
      this.selectGdprAgreement,
      this.updateUserData,
      this.userData,
      this.userType,
      this.view,
      this.displaySubtotal,
      this.walletSystem,this.shipToAnother,this.storefrontId);
}