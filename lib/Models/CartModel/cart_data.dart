
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/storeData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CartModel/tax_summary.dart';

import '../ShippingModel/Request/user_data.dart';
import 'applied_promotions.dart';
import 'cart_product.dart';
part 'cart_data.g.dart';
@JsonSerializable()
class CartData{
  @JsonKey(name:"products")
  
   List<CartProduct>? products;
  // @JsonKey(name:"user_data")
  //
  //  UserData? userData;
  @JsonKey(name:"tax_subtotal")

  dynamic taxSubtotal;
  @JsonKey(name:"format_tax_subtotal")
  
   String? formatTaxSubtotal;
  @JsonKey(name:"discount")

  dynamic discount = 0;
  @JsonKey(name:"format_discount")
  
   String? formatDiscount;
  @JsonKey(name:"total")

  dynamic total = 0.0;
  @JsonKey(name:"format_total")
   String? formatTotal;

  @JsonKey(name:"amount")
  
   int? amount;
  @JsonKey(name:"display_subtotal")

  dynamic displaySubtotal = 0.0;
  @JsonKey(name:"format_display_subtotal")
  
   String? formatDisplaySubtotal;
  @JsonKey(name:"display_shipping_cost")

  dynamic displayShippingCost;
  @JsonKey(name:"format_display_shipping_cost")
  
   String? formatDisplayShippingCost;
  @JsonKey(name:"applied_promotions")
  
   List<AppliedPromotions>? appliedPromotions;
  @JsonKey(name:"pending_certificates")
  
   List<String>? pendingCertificates;
  @JsonKey(name:"gift_cert_cost")
  
   String? giftCertCost;
  
  @JsonKey(name:"format_tax")

  dynamic formatTax;

  @JsonKey(name:"format_order_discount")
  dynamic orderDiscount;

  @JsonKey(name:"tax_summary")
  TaxSummary? taxSummary;

  @JsonKey(name:"shipping_id")
  String? shippingId;

  @JsonKey(name:"shipping_cost")
  String? shippingCost;

  @JsonKey(name:"format_shipping_cost")
  String? formatShippingCost;

  @JsonKey(name:"shipping_name")
  String? shippingName;

  @JsonKey(name:"store_data")
  StoreData? storeData;


  @JsonKey(name:"user_points")
  int? userPoints;

  @JsonKey(name:"points_in_use")
  int? pointsInUse;

  @JsonKey(name:"allowPaymentByPoints")
  bool? allowPaymentByPoints;



  CartData({
    this.products,
 //   this.userData,
    this.taxSubtotal,
    this.formatTaxSubtotal,
    this.discount,
    this.formatDiscount,
    this.total,
    this.formatTotal,
    this.amount,
    this.displaySubtotal,
    this.formatDisplaySubtotal,
    this.displayShippingCost,
    this.formatDisplayShippingCost,
    this.appliedPromotions,
    this.pendingCertificates,
    this.giftCertCost,
    this.formatTax,
    this.orderDiscount,
    this.taxSummary,
    this.storeData,
    this.formatShippingCost, this.shippingCost, this.shippingId, this.shippingName, this.userPoints, this.pointsInUse, this.allowPaymentByPoints
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}