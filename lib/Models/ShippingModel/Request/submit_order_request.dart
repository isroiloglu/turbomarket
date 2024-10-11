
import 'shipping_method_request.dart';
import 'package:json_annotation/json_annotation.dart';
part 'submit_order_request.g.dart';

@JsonSerializable()
class SubmitOrderRequestData{

  @JsonKey(name:"after_coupon_code_total")
  String? afterCouponCodeTotal;

  @JsonKey(name:"apply_wallet_cash")
  bool? applyWalletCash;

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"current_cash")
  double? currentCash;

  @JsonKey(name:"gc")
  String? gc;

  @JsonKey(name:"guest_checkout")
  ShippingMethodRequest? guestCheckout;

  @JsonKey(name:"lang_code")
  String? langCode;

  @JsonKey(name:"notes")
  String? notes;

  @JsonKey(name:"payment_id")
  String? paymentId;

  @JsonKey(name:"ship_to_another")
  int? shipToAnother;

  @JsonKey(name:"shipping_id")
  List<String>? shippingId;

  @JsonKey(name:"user_id")
  String? userId;

  @JsonKey(name:"display_subtotal")
  double? displaySubtotal;

  @JsonKey(name:"wallet_system")
  double? walletSystem;

  @JsonKey(name:"card_number")
  String? cardNumber;

  @JsonKey(name:"expiry_month")
  String? expiryMonth;

  @JsonKey(name:"expiry_year")
  String? expiryYear;

  @JsonKey(name:"cardholder_name")
  String? cardholderName;

  @JsonKey(name:"cvv2")
  String? cvv2;

  @JsonKey(name:"po_number")
  String? poNumber;

  @JsonKey(name:"company_name")
  String? companyName;

  @JsonKey(name:"buyer_name")
  String? buyerName;

  @JsonKey(name:"position")
  String? position;

  @JsonKey(name:"storefront_id")
  String? storeFrontId;

  SubmitOrderRequestData.empty();


  SubmitOrderRequestData(
      this.afterCouponCodeTotal,
      this.applyWalletCash,
      this.companyId,
      this.currencyCode,
      this.gc,
      this.guestCheckout,
      this.langCode,
      this.notes,
      this.paymentId,
      this.shipToAnother,
      this.shippingId,
      this.userId,
      this.displaySubtotal,
      this.walletSystem,
      this.cardNumber,
      this.expiryMonth,
      this.expiryYear,
      this.cardholderName,
      this.cvv2,
      this.poNumber,
      this.companyName,
      this.buyerName,
      this.position,this.storeFrontId);

  factory SubmitOrderRequestData.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitOrderRequestDataToJson(this);


}


