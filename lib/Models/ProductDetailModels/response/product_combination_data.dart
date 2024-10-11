
import 'package:json_annotation/json_annotation.dart';

import 'combination_option_variant.dart';
import 'image.dart';

part 'product_combination_data.g.dart';

@JsonSerializable()
class ProductCombinationData {
  @JsonKey(name: "configured_id")
  String? configuredId;

  @JsonKey(name: "product_code")
  String? productCode;

  @JsonKey(name: "amount")
  String? quantityAvailable;

  @JsonKey(name: "main_pair")
  ProductImage? mainPairImage;

  @JsonKey(name: "additional_images")
  List<ProductImage>? additionalImages;

  @JsonKey(name: "variation_options")
  List<CombinationOptionVariant>? optionsCombinationList;

  ProductCombinationData(
      {this.configuredId,
        this.additionalImages,
        this.mainPairImage,
        this.quantityAvailable,
        this.productCode,
        this.optionsCombinationList});

  factory ProductCombinationData.fromJson(Map<String, dynamic> json) =>
      _$ProductCombinationDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCombinationDataToJson(this);
}
