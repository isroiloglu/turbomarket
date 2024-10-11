import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order{

  @JsonKey(name:"order_id")

  String? orderId;
  @JsonKey(name:"issuer_id")

  String? issuerId;
  @JsonKey(name:"user_id")

  String? userId;
  @JsonKey(name:"is_parent_order")

  String? isParentOrder;
  @JsonKey(name:"parent_order_id")

  String? parentOrderId;
  @JsonKey(name:"company_id")

  String? companyId;
  @JsonKey(name:"timestamp")

  String? timestamp;
  @JsonKey(name:"firstname")

  String? firstname;
  @JsonKey(name:"lastname")

  String? lastname;
  @JsonKey(name:"email")

  String? email;
  @JsonKey(name:"phone")

  String? phone;
  @JsonKey(name:"status")

  String? status;
  @JsonKey(name:"total")

  String? total;
  @JsonKey(name:"invoice_id")

  Object? invoiceId;
  @JsonKey(name:"credit_memo_id")

  Object? creditMemoId;
  @JsonKey(name:"points")

  Object? points;

  @JsonKey(name:"color")

  String? color;

  Order(
      this.orderId,
      this.issuerId,
      this.userId,
      this.isParentOrder,
      this.parentOrderId,
      this.companyId,
      this.timestamp,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.status,
      this.total,
      this.invoiceId,
      this.creditMemoId,
      this.points,
      this.color);


  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}