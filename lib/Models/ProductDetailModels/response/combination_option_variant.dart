import 'package:json_annotation/json_annotation.dart';

part 'combination_option_variant.g.dart';

@JsonSerializable()
class CombinationOptionVariant {
  @JsonKey(name: "option_id")
  dynamic optionId;
  @JsonKey(name: "variant_id")
  dynamic variantId;

  CombinationOptionVariant({this.variantId, this.optionId});

  factory CombinationOptionVariant.fromJson(Map<String, dynamic> json) =>
      _$CombinationOptionVariantFromJson(json);


  @override
  String toString() {
    return 'CombinationOptionVariant{optionId: $optionId, variantId: $variantId}';
  }

  Map<String, dynamic> toJson() => _$CombinationOptionVariantToJson(this);
}
