import 'package:json_annotation/json_annotation.dart';
part 'product_option.g.dart';

@JsonSerializable()
class ProductOption {
  @JsonKey(name: "option_id")
  int? optionId;
  @JsonKey(name: "option_value")
  String? optionValue;
  @JsonKey(name: "variant_id")
  dynamic variantId;
  @JsonKey(name: "variant_value")
  String? variantValue;

  ProductOption({this.optionId, this.optionValue, this.variantId, this.variantValue});

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionToJson(this);
}