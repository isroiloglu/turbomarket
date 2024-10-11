import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderDetailModel/storeData.dart';

import 'billing_address.dart';
import 'order_post.dart';
import 'order_product.dart';
import 'order_summary.dart';

part 'order_details_model.g.dart';

@JsonSerializable()
class OrderDetailsModel {
  @JsonKey(name: "order_id")
  String? orderId;
  @JsonKey(name: "company_id")
  String? companyId;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "summary")
  OrderSummary? summary;

  @JsonKey(name: "timestamp")
  String? timestamp;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "fax")
  String? fax;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "notes")
  String? notes;
  @JsonKey(name: "secondary_currency")
  String? secondaryCurrency;
  @JsonKey(name: "shipping_address")
  BillingAddress? shippingAddress;
  @JsonKey(name: "billing_address")
  BillingAddress? billingAddress;
  @JsonKey(name: "products")
  List<OrderProduct>? products;

  @JsonKey(name:"use_gift_certificates")

  List<UseGiftCertificates>? giftCertficates = null;
  @JsonKey(name: "applied_coupons")
  List<String>? appliedCoupons;
  @JsonKey(name: "promotions")
  List<String>? promotions;
  @JsonKey(name: "shipping_method")
  List<String>? shippingMethod;

  // @JsonKey(name:("tracking_ids")
  //
  //  List<TrackingId>? trackingIds;

  @JsonKey(name: "rma")
  int? rma;

  @JsonKey(name: "is_discussion_initiate")
  int? isDiscussionInitiate;
  @JsonKey(name: "thread_id")
  String? threadId;
  @JsonKey(name: "posts")
  List<OrderPost>? posts;

  @JsonKey(name: "error")
  bool? error = false;


  @JsonKey(name: "msg")
  String? msg;
  @JsonKey(name: "latest")
  bool? latest = false;

  @JsonKey(name:"po_number")
  String? poNumber;

  @JsonKey(name:"company_name")
  String? companyName;

  @JsonKey(name:"buyer_name")
  String? buyerName;

  @JsonKey(name:"position")
  String? position;

  @JsonKey(name:"card_number")
  String? cardNumber;

  @JsonKey(name:"cardholder_name")
  String? cardholderName;

  @JsonKey(name:"expiry_month")
  String? expiryMonth;

  @JsonKey(name:"expiry_year")
  String? expiryYear;


  @JsonKey(name:"user_points")
  dynamic? userPoints;

  @JsonKey(name:"points_in_use")
  dynamic? pointsInUse;

  @JsonKey(name:"reward_points")
  dynamic? rewardPoints;

  @JsonKey(name:"store_data")
  StoreData? storeData;


  OrderDetailsModel(
      this.orderId,
      this.companyId,
      this.userId,
      this.summary,
      this.timestamp,
      this.status,
      this.userName,
      this.email,
      this.phone,
      this.fax,
      this.paymentMethod,
      this.notes,
      this.secondaryCurrency,
      this.shippingAddress,
      this.billingAddress,
      this.products,
      this.giftCertficates,
      this.appliedCoupons,
      this.promotions,
      this.shippingMethod,
      this.rma,
      this.isDiscussionInitiate,
      this.threadId,
      this.posts,
      this.error,
      this.msg,
      this.latest,
      this.poNumber,
      this.companyName,
      this.buyerName,
      this.position,
      this.cardNumber,
      this.cardholderName,
      this.expiryMonth,
      this.expiryYear,
      this.userPoints,
      this.pointsInUse,
      this.rewardPoints,this.storeData);

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsModelToJson(this);
}


class UseGiftCertificates {
  String? code;
  String? price;

  UseGiftCertificates({this.code, this.price});

  UseGiftCertificates.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['price'] = this.price;
    return data;
  }}
