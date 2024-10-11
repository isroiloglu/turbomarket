import 'package:json_annotation/json_annotation.dart';
part 'remove_cart_request.g.dart';

@JsonSerializable()
class RemoveCartRequest{
  @JsonKey(name:"customerId")
  String? customerId;
  @JsonKey(name:"width")
  int? width;
  @JsonKey(name:"gc")
  String? giftCode;
  @JsonKey(name:"scope")
  String? scope;
  @JsonKey(name:"lang_code")
  String? langCode;
  @JsonKey(name:"currency_code")
  String? currencyCode;

  RemoveCartRequest({
    this.customerId,
    this.width,
    this.giftCode,
    this.scope,
    this.langCode,
    this.currencyCode,
  });

  factory RemoveCartRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveCartRequestToJson(this);
}