import 'package:json_annotation/json_annotation.dart';

import 'guestUserData.dart';
part 'submitDataRequest.g.dart';


@JsonSerializable()
class SubmitUserDataRequest{

  SubmitUserDataRequest.empty();

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"wallet_system")
  double? walletSystem;

  @JsonKey(name:"display_subtotal")
  double? displaySubtotal;

  @JsonKey(name:"view")
  String? view;

  @JsonKey(name:"user_type")
  String? userType;

  @JsonKey(name:"ship_to_another")
  int? shipToAnother;

  @JsonKey(name:"select_gdpr_agreement")
  String? selectGdprAgreement;

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"guest_checkout")
  String? guestCheckout;

  @JsonKey(name:"gc")
  String? gc;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"user_data")
  GuestUserData? userData;

  SubmitUserDataRequest(
      this.companyId,
      this.walletSystem,
      this.displaySubtotal,
      this.view,
      this.userType,
      this.shipToAnother,
      this.selectGdprAgreement,
      this.langCode,
      this.guestCheckout,
      this.gc,
      this.currencyCode,
      this.userData);

  factory SubmitUserDataRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitUserDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitUserDataRequestToJson(this);
}


