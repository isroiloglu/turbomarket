import 'package:json_annotation/json_annotation.dart';

part 'order_communication_msg_request.g.dart';

@JsonSerializable()
class OrderCommunicationMSGRequest {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "thread_id")
  String? threadId;
  @JsonKey(name: "order_id")
  String? orderId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "select_gdpr_agreement")
  String? selectGdprAgreement = "Y";
  bool? gdprAggrement = false;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "user_type")
  String? userType;

  @JsonKey(name: "storefront_id")
  String? storefrontDd;

  OrderCommunicationMSGRequest(this.message, this.threadId, this.orderId,
      this.name, this.selectGdprAgreement, this.gdprAggrement, this.userId,this.userType,this.storefrontDd);

  factory OrderCommunicationMSGRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderCommunicationMSGRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCommunicationMSGRequestToJson(this);
}