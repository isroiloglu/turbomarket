import 'package:json_annotation/json_annotation.dart';

part 'cart_product_option.g.dart';

@JsonSerializable()
class CartProductOption {
  @JsonKey(name: "option_id")
  int? optionId;
  @JsonKey(name: "option_value")
  String? optionValue;
  @JsonKey(name: "variant_id")
  dynamic variantId;
  @JsonKey(name: "variant_value")
  String? variantValue;

  CartProductOption({this.optionId, this.optionValue, this.variantId, this.variantValue});

  factory CartProductOption.fromJson(Map<String, dynamic> json) =>
      _$CartProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductOptionToJson(this);
}