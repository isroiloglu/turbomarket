import 'package:json_annotation/json_annotation.dart';
part 'remove_cart_item_request.g.dart';

@JsonSerializable()
class RemoveCartItemRequest{
  @JsonKey(name:"customerId")
  String? customerId;
  @JsonKey(name:"width")
  int? width;
  @JsonKey(name:"gc")
  String? giftCode;
  @JsonKey(name:"scope")
  String? scope;
  @JsonKey(name:"item_id")
  String? itemId;
  @JsonKey(name:"lang_code")
  String? langCode;
  @JsonKey(name:"currency_code")
  String? currencyCode;

  RemoveCartItemRequest({
     this.customerId,
     this.width,
     this.giftCode,
     this.scope,
     this.itemId,
     this.langCode,
     this.currencyCode,
  });

  factory RemoveCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveCartItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveCartItemRequestToJson(this);
}