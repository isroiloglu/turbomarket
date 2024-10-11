import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_request.g.dart';

@JsonSerializable()
class AddToCartRequest {
  @JsonKey(name: "currency_code")
  String? currencyCode;
  @JsonKey(name: "lang_code")
  String? languageCode;
  @JsonKey(name: "product_data")
  Map<String, dynamic>? productData;

  @JsonKey(name:"storefront_id")
  String? storefrontId;
  AddToCartRequest({this.currencyCode, this.languageCode, this.productData,this.storefrontId});

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);

  @override
  String toString() {
    return 'AddToCartRequest{productData: $productData}';
  }
}
