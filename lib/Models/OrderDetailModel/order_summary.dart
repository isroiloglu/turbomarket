import 'package:json_annotation/json_annotation.dart';

import 'order_taxes.dart';
part 'order_summary.g.dart';

@JsonSerializable()

class OrderSummary{
  @JsonKey(name:"total")
  String? total;

  @JsonKey(name:"formattotal")
  String? formatTotal;


  @JsonKey(name:"subtotal")
  dynamic subtotal;

  @JsonKey(name:"formatsubtotal")
  
   String? formatSubtotal;
  @JsonKey(name:"discount")
  
   double? discount;
  @JsonKey(name:"formatdiscount")
  
   String? formatDiscount;
  @JsonKey(name:"payment_surcharge")
  
   double? paymentSurcharge;
  @JsonKey(name:"formatpayment_surcharge")
  
   String? formatPaymentSurcharge;
  @JsonKey(name:"taxes")
  
   List<OrderTaxes>? taxes;
  @JsonKey(name:"shipping_cost")
  
   String? shippingCost;
  @JsonKey(name:"formatshipping_cost")
  
   String? formatShippingCost;
  @JsonKey(name:"format_order_discount")

  String orderDiscount;


  OrderSummary(
      this.total,
      this.formatTotal,
      this.subtotal,
      this.formatSubtotal,
      this.discount,
      this.formatDiscount,
      this.paymentSurcharge,
      this.formatPaymentSurcharge,
      this.taxes,
      this.shippingCost,
      this.formatShippingCost,this.orderDiscount);

  factory OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderSummaryToJson(this);
}