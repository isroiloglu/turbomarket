import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PlaceOrderRequest/PaymentInfoModel.dart';

import 'guestCheckoutModel.dart';

part 'placeOrderRequest.g.dart';

@JsonSerializable()
class PlaceOrderRequest{

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
  GuestCheckoutModel guestCheckout=GuestCheckoutModel.empty();

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

  @JsonKey(name:"used_cash")
  int? usedCash;

  @JsonKey(name:"user_id")
  String? userId;

  @JsonKey(name:"display_subtotal")
  double? displaySubtotal;

  @JsonKey(name:"wallet_system")
  double? walletSystem;

  @JsonKey(name:"storefront_id")
  String? storeFrontId;

  @JsonKey(name:"store_id")
  String? storeId;

  @JsonKey(name:"points_to_use")
  String? pointsToUse;

  @JsonKey(name:"payment_info")
  PaymentInfoModel paymentInfo=PaymentInfoModel.empty();


  PlaceOrderRequest.empty();


  PlaceOrderRequest(
      this.afterCouponCodeTotal,
      this.applyWalletCash,
      this.companyId,
      this.currencyCode,
      this.currentCash,
      this.gc,
      this.guestCheckout,
      this.langCode,
      this.notes,
      this.paymentId,
      this.shipToAnother,
      this.shippingId,
      this.usedCash,
      this.userId,
      this.displaySubtotal,
      this.walletSystem,
      this.storeFrontId,
      this.storeId,
      this.pointsToUse,
      this.paymentInfo
      );

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderRequestToJson(this);
}