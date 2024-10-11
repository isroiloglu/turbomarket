/*
 *  Webkul Software.
 *
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */

import 'package:json_annotation/json_annotation.dart';

part 'PaymentInfoModel.g.dart';

@JsonSerializable()
class PaymentInfoModel {
  @JsonKey(name: 'selected_card')
  String? selectedCard;
  @JsonKey(name: 'card_number')
  String? cardNumber;
  @JsonKey(name: 'expiry_month')
  String? expiryMonth;
  @JsonKey(name: 'expiry_year')
  String? expiryYear;
  @JsonKey(name: 'account')
  String? account;
  @JsonKey(name: 'cardid')
  String? cardid;
  @JsonKey(name: 'otp')
  String? otp;

  PaymentInfoModel.empty();

  PaymentInfoModel(
    this.selectedCard,
    this.cardNumber,
    this.expiryMonth,
    this.expiryYear,
    this.account,
    this.cardid,
    this.otp,
  );

  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInfoModelToJson(this);
}
