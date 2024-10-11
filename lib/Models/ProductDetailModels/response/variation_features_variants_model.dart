import 'package:json_annotation/json_annotation.dart';

import 'feature_variant_model.dart';
part 'variation_features_variants_model.g.dart';

@JsonSerializable()
class VariationFeaturesVariantsModel {
  @JsonKey(name: "feature_id")
  String? featureId;

  @JsonKey(name: "feature_style")
  String? featureStyle;
  @JsonKey(name: "description")
  String? description;

  String? position;

  String? purpose;

  @JsonKey(name: "display_on_catalog")
  String? displayOnCatalog;

  @JsonKey(name: "purpose_position")
  String? purposePosition;

  String? variant;

  @JsonKey(name: "variant_id")
  String? variantId;

  @JsonKey(name: "variant_position")
  String? variantPosition;

  @JsonKey(name: "internal_name")
  String? internalName;
  @JsonKey(name: "variants")
  List<FeatureVariantModel>? featureVariantsList;

  VariationFeaturesVariantsModel({this.purpose, this.variant, this.variantId, this.featureId, this.description, this.displayOnCatalog, this.featureStyle, this.featureVariantsList, this.position, this.purposePosition, this.variantPosition});

  factory VariationFeaturesVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$VariationFeaturesVariantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariationFeaturesVariantsModelToJson(this);

}