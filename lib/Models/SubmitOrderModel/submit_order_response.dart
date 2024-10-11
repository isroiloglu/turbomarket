import 'package:json_annotation/json_annotation.dart';
part 'submit_order_response.g.dart';

@JsonSerializable()
class SubmitOrderResponse {
  @JsonKey(name: "order_id")
  @JsonKey(name: 'orderid')
  int? orderId = 0;

  @JsonKey(name: "error")
  bool error = false;

  @JsonKey(name: "msg")
  String? msg = "";

  @JsonKey(name: "url")
  final Url? url;

  @JsonKey(name: "refreshtoken")
  String? refreshToken;

  @JsonKey(name: "billId")
  String? billId;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "user_id")
  String? userId;

  @JsonKey(name: "guest_checkout")
  bool? guestCheckout;

  @JsonKey(name: "anor_verify")
  bool? anorVerify;

  SubmitOrderResponse(this.orderId, this.error, this.msg, this.url);

  factory SubmitOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitOrderResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Url {
  @JsonKey(defaultValue: '')
  final String? payment;
  @JsonKey(defaultValue: '')
  final String? success;

  const Url({
    required this.payment,
    required this.success,
  });

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
