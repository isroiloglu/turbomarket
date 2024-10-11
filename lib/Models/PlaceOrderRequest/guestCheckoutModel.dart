import 'package:json_annotation/json_annotation.dart';

import '../AccountModels/Request/profileData.dart';

part 'guestCheckoutModel.g.dart';

@JsonSerializable()
class GuestCheckoutModel{

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"gc")
  String? gc;

  @JsonKey(name:"guest_checkout")
  String? guestCheckout;

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"profile_id")
  String? profileId;

  @JsonKey(name:"select_gdpr_agreement")
  String? selectGdprAgreement;

  @JsonKey(name:"ship_to_another")
  int? shipToAnother;

  @JsonKey(name:"user_data")
  ProfileData userData=ProfileData.empty();

  @JsonKey(name:"user_type")
  String? userType;

  @JsonKey(name:"view")
  String? view;

  @JsonKey(name:"display_subtotal")
  double? displaySubtotal;

  @JsonKey(name:"wallet_system")
  double? walletSystem;

  GuestCheckoutModel.empty();

  GuestCheckoutModel(
      this.companyId,
      this.currencyCode,
      this.gc,
      this.guestCheckout,
      this.langCode,
      this.profileId,
      this.selectGdprAgreement,
      this.shipToAnother,
      this.userData,
      this.userType,
      this.view,
      this.displaySubtotal,
      this.walletSystem);

  factory GuestCheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$GuestCheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuestCheckoutModelToJson(this);

}